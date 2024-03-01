insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH tmp AS (SELECT balance.user_id AS bal_user_id, balance.money, balance.updated,
                        currency.name AS cur_name, currency.rate_to_usd AS cur_rate, currency.updated AS cur_updated
                 FROM balance
                 JOIN currency ON balance.currency_id = currency.id
                ),
     all_join AS (SELECT t2.id, t2.cur_name, t2.money, t2.updated, COALESCE(t1.diff, t2.diff) AS new_diff
                  FROM (SELECT tmp.bal_user_id AS id, cur_name, money, updated, MIN(updated - cur_updated) AS diff
                        FROM tmp
                        WHERE updated - cur_updated > INTERVAL '0 days'
                        GROUP BY id, cur_name, money, updated
                       ) t1
                  FULL JOIN (SELECT tmp.bal_user_id AS id, cur_name, money, updated, MAX(updated - cur_updated) AS diff
                             FROM tmp
                             WHERE updated - cur_updated < INTERVAL '0 days'
                             GROUP BY id, cur_name, money, updated
                            ) t2
                  ON t1.id = t2.id AND t1.cur_name = t2.cur_name AND t1.money = t2.money AND t1.updated = t2.updated
                 )

SELECT COALESCE("user".name, 'not defined') AS name, COALESCE("user".lastname, 'not defined') AS lastname,
       all_join.cur_name AS currency_name,
       all_join.money * currency.rate_to_usd AS currency_in_usd
FROM all_join
LEFT JOIN "user" ON all_join.id = "user".id
LEFT JOIN currency ON all_join.new_diff = (all_join.updated - currency.updated) AND all_join.cur_name = currency.name
ORDER BY name DESC, lastname ASC, currency_name ASC;

