--usersテーブル
insert into users (user_name, pass) 
values ('Yamada', 16231), ('Tanaka', 12345), ('Aoki', 98765);

--storeテーブル
insert into store (store_name, info, adress, location) 
values ('アートホテル盛岡', '宿泊施設', '岩手県盛岡市大通３丁目３−１８', '(39.70390347620192, 141.14245088825996)'), 
('R&Bホテル盛岡駅前', '宿泊施設', '岩手県盛岡市盛岡駅前通９−４', '(39.702553360675275, 141.13780666892916)'),
('ホテルメトロポリタン盛岡本館', '宿泊施設', '岩手県盛岡市盛岡駅前通１−４４', '(39.70297224797235, 141.1355778983434)');

--couponテーブル
insert into coupon (coupon_name, effect) 
values ('おでんせ岩手県', '岩手県の宿泊施設で使える3,000円割引クーポン,  他の割引と併用可能');

--available_storesテーブル
insert into available_stores (coupon_id, store_id) 
select coupon.coupon_id, store.store_id
from coupon, store
where coupon.coupon_name = 'おでんせ岩手県' and store.store_name = 'アートホテル盛岡';

insert into available_stores (coupon_id, store_id) 
select coupon.coupon_id, store.store_id
from coupon, store
where coupon.coupon_name = 'おでんせ岩手県' and store.store_name = 'R&Bホテル盛岡駅前';

insert into available_stores (coupon_id, store_id) 
select coupon.coupon_id, store.store_id
from coupon, store
where coupon.coupon_name = 'おでんせ岩手県' and store.store_name = 'ホテルメトロポリタン盛岡本館';

--periodテーブル
insert into period (user_id, coupon_id, number, expire_date) 
select users.user_id, coupon.coupon_id, 5, '2021-3-7'
from users, coupon
where users.user_name = 'Yamada' and coupon.coupon_name = 'おでんせ岩手県';

insert into period (user_id, coupon_id, number, expire_date) 
select users.user_id, coupon.coupon_id, 3, '2021-3-7'
from users, coupon
where users.user_name = 'Aoki' and coupon.coupon_name = 'おでんせ岩手県';