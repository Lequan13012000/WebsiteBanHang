use WebsiteBanHang




create table products
(
	id int not null primary key,
	name_pr nvarchar(100)  null,
	id_type int null,
	description_pr nvarchar(1000) null,
	unit_price float null,
	promotion_price float null,
	images varchar(255) null,
	unit varchar(255) null,
	new tinyint default 0,
	created_at smalldatetime null,
	updated_at smalldatetime null,  
)
go
alter table products
add constraint fk_id_type
foreign key (id_type) references type_products(id)
go
create table type_products(
id int not null primary key,
name_typepr nvarchar(100) not null,
description_typepr nvarchar(1000) not null,
images varchar(255) not null,
create_at smalldatetime null,
updated_at smalldatetime null,
)
go
create table bill_detail(
id int not null primary key,
id_bill int not null,
id_product int not null,
quantity int not null,
unit_price float not null,
created_at smalldatetime , 
updated_at timestamp 
)
go
alter table bill_detail
add constraint fk_id_product
foreign key (id_product) references products(id)
go
CREATE TABLE bills(
  id int NOT NULL primary key,
  id_customer int NULL,
  date_order date NULL,
  total float  NULL,
  payment varchar(200) NULL,
  note varchar(500) NULL,
  created_at smalldatetime,
  updated_at timestamp 
) 
go
alter table bills
add constraint fk_id_customer
foreign key (id_customer) references customer(id)
go
CREATE TABLE customer(
  id int NOT NULL primary key ,
  name_cus varchar(100) NOT NULL,
  gender varchar(10) NOT NULL,
  email varchar(50) NOT NULL,
  address_cus varchar(100) NOT NULL,
  phone_number varchar(20) NOT NULL,
  note varchar(200) NOT NULL,
  created_at smalldatetime,
  updated_at timestamp NOT NULL
)
go
CREATE TABLE users (
  id int NOT NULL primary key,
  full_name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  password_us varchar(255) NOT NULL,
  phone varchar(20) NULL,
  address_us varchar(255) NULL,
  remember_token varchar(100) NULL,
  created_at smalldatetime NULL,
  updated_at timestamp NULL
) 
go
CREATE TABLE news (
  id int NOT NULL primary key,
  title varchar(200) NOT NULL ,
  content text NOT NULL ,
  image varchar(100) NOT NULL,
  create_at smalldatetime,
  update_at timestamp NOT NULL 
)
go
CREATE TABLE slide(
  id int NOT NULL primary key,
  link varchar(100) NOT NULL,
  image_sl varchar(100) NOT NULL
) 


INSERT INTO products (id, name_pr, id_type, description_pr, unit_price, promotion_price, images, unit,new,created_at,updated_at) VALUES
(1,	N'Bánh Crepe Sầu riêng', 5, N'Bánh crepe sầu riêng nhà làm', 150000, 120000, 'slide/1430967449-pancake-sau-rieng-6.jpg', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(2, N'Bánh Crepe Chocolate', 6, '', 180000, 160000, 'slide/crepe-chocolate.jpg', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(3, N'Bánh Crepe Sầu riêng - Chuối', 5, '', 150000, 120000, 'slide/crepe-chuoi.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(4, N'Bánh Crepe Đào', 5, '', 160000, 150000, 'slide/crepe-dao.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(5, N'Bánh Crepe Dâu', 5, '', 160000, 0, 'slide/crepedau.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(6, N'Bánh Crepe Pháp', 5, '', 200000, 180000, 'slide/crepe-phap.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(7, N'Bánh Crepe Táo', 5, '', 160000, 150000, 'slide/crepe-tao.jpg', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(8, N'Bánh Crepe Trà xanh', 5, '', 160000, 150000, 'slide/crepe-traxanh.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(9, N'Bánh Crepe Sầu riêng và Dứa', 5, '', 160000, 150000, 'slide/saurieng-dua.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(11, N'Bánh Gato Trái cây Việt Quất', 3, '', 250000, 0, 'slide/544bc48782741.png', 'cái', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(12, N'Bánh sinh nhật rau câu trái cây', 3, '', 200000, 180000, 'slide/210215-banh-sinh-nhat-rau-cau-body- (6).jpg', 'cái', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(13, N'Bánh kem Chocolate Dâu', 3, '', 300000, 280000, 'slide/banh kem sinh nhat.jpg', 'cái', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(14, N'Bánh kem Dâu III', 3, '', 300000, 280000, 'slide/Banh-kem (6).jpg', 'cái', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(15, N'Bánh kem Dâu I', 3, '', 350000, 320000, 'slide/banhkem-dau.jpg', 'cái', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(16, N'Bánh trái cây II', 3, '', 150000, 120000, 'slide/banhtraicay.jpg', 'hộp', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(17, N'Apple Cake', 3, '', 250000, 240000, 'slide/Fruit-Cake_7979.jpg', 'cai', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(18, N'Bánh ngọt nhân cream táo', 2, '', 180000, 0, 'slide/20131108144733.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(19, N'Bánh Chocolate Trái cây', 2, '', 150000, 140000, 'slide/Fruit-Cake_7976.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(20, N'Bánh Chocolate Trái cây II', 2, '', 150000, 140000, 'slide/Fruit-Cake_7981.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(21, N'Peach Cake', 2, '', 160000, 150000, 'slide/Peach-Cake_3294.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(22, N'Bánh bông lan trứng muối I', 1, '', 160000, 150000, 'slide/banhbonglantrung.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(23, N'Bánh bông lan trứng muối II', 1, '', 180000, 0, 'slide/banhbonglantrungmuoi.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(24, N'Bánh French', 1, '', 180000, 0, 'slide/banh-man-thu-vi-nhat-1.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(25, N'Bánh mì Australia', 1, '', 80000, 70000, 'slide/dung-khoai-tay-lam-banh-gato-man-cuc-ngon.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(26, N'Bánh mặn thập cẩm', 1, '', 50000, 0, 'slide/Fruit-Cake.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(27, N'Bánh Muffins trứng', 1, '', 100000, 80000, 'slide/maxresdefault.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(28, N'Bánh Scone Peach Cake', 1, '', 120000, 0, 'slide/Peach-Cake_3300.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(29, N'Bánh mì Loaf I', 1, '', 100000, 0, 'slide/sli12.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(30, N'Bánh kem Chocolate Dâu I', 4, '', 380000, 350000, 'slide/sli12.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(31, N'Bánh kem Trái cây I', 4, '', 380000, 350000, 'slide/Fruit-Cake.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(32, N'Bánh kem Trái cây II', 4, '', 380000, 350000, 'slide/Fruit-Cake_7971.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(33, N'Bánh kem Doraemon', 4, '', 280000, 250000, 'slide/p1392962167_banh74.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(34, N'Bánh kem Caramen Pudding', 4, '', 280000, 0, 'slide/Caramen-pudding636099031482099583.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(35, N'Bánh kem Chocolate Fruit', 4, '', 320000, 300000, 'slide/chocolate-fruit636098975917921990.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(36, N'Bánh kem Coffee Chocolate GH6', 4, '', 320000, 300000, 'slide/COFFE-CHOCOLATE636098977566220885.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(37, N'Bánh kem Mango Mouse', 4, '', 320000, 300000, 'slide/mango-mousse-cake.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(38, N'Bánh kem Matcha Mouse', 4, '', 350000, 330000, 'slide/MATCHA-MOUSSE.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(39, N'Bánh kem Flower Fruit', 4, '', 350000, 330000, 'slide/flower-fruits636102461981788938.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(40, N'Bánh kem Strawberry Delight', 4, '', 350000, 330000, 'slide/strawberry-delight636102445035635173.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(41, N'Bánh kem Raspberry Delight', 4, '', 350000, 330000, 'slide/raspberry.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(42, N'Beefy Pizza', 6, N'Thịt bò xay, ngô, sốt BBQ, phô mai mozzarella', 150000, 130000, 'slide/40819_food_pizza.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(43, N'Hawaii Pizza', 6, N'Sốt cà chua, ham , dứa, pho mai mozzarella', 120000, 0, 'slide/hawaiian paradise_large-900x900.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(44, N'Smoke Chicken Pizza', 6, N'Gà hun khói,nấm, sốt cà chua, pho mai mozzarella.', 120000, 0, 'slide/chicken black pepper_large-900x900.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(45, N'Sausage Pizza', 6, N'Xúc xích klobasa, Nấm, Ngô, sốtcà chua, pho mai Mozzarella.', 120000, 0, 'slide/pizza-miami.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(46, N'Ocean Pizza', 6, N'Tôm , mực, xào cay,ớt xanh, hành tây, cà chua, phomai mozzarella.', 120000, 0, 'slide/seafood curry_large-900x900.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(47, N'All Meaty Pizza', 6, N'Ham, bacon, chorizo, pho mai mozzarella.', 140000, 0, 'slide/all1).jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(48, N'Tuna Pizza', 6, N'Cá Ngừ, sốt Mayonnaise,sốt càchua, hành tây, pho mai Mozzarella', 140000, 0, 'slide/54eaf93713081_-_07-germany-tuna.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(49, N'Bánh su kem nhân dừa', 7, '', 120000, 100000, 'slide/maxresdefault.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(50, N'Bánh su kem sữa tươi', 7, '', 120000, 100000, 'slide/sukem.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(51, N'Bánh su kem sữa tươi chiên giòn', 7, '', 150000, 0, 'slide/1434429117-banh-su-kem-chien-20.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(52, N'Bánh su kem dâu sữa tươi', 7, '', 150000, 0, 'slide/sukemdau.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(53, N'Bánh su kem bơ sữa tươi', 7, '', 150000, 0, 'slide/He-Thong-Banh-Su-Singapore-Chewy-Junior.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(54, N'Bánh su kem nhân trái cây sữa tươi', 7, '', 150000, 0, 'slide/foody-banh-su-que-635930347896369908.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(55, N'Bánh su kem cà phê', 7, '', 150000, 0, 'slide/banh-su-kem-ca-phe-1.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(56, N'Bánh su kem phô mai', 7, '', 150000, 0, 'slide/50020041-combo-20-banh-su-que-pho-mai-9.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(57, N'Bánh su kem sữa tươi chocolate', 7, '', 150000, 0, 'slide/combo-20-banh-su-que-kem-sua-tuoi-phu-socola.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(58, N'Bánh Macaron Pháp', 2, N'Thưởng thức macaron, người ta có thể tìm thấy từ những hương vị truyền thống như mâm xôi, chocolate, cho đến những hương vị mới như nấm và trà xanh. Macaron với vị giòn tan của vỏ bánh, béo ngậy ngọt ngào của phần nhân, với vẻ ngoài đáng yêu và nhiều màu sắc đẹp mắt, đây là món bạn không nên bỏ qua khi khám phá nền ẩm thực Pháp.', 200000, 180000, 'Maslide/caron9.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(59, N'Bánh Tiramisu - Italia', 2, N'Chỉ cần cắn một miếng, bạn sẽ cảm nhận được tất cả các hương vị đó hòa quyện cùng một chính vì thế người ta còn ví món bánh này là Thiên đường trong miệng của bạn', 200000, 0, 'slide/234.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(60, N'Bánh Táo - Mỹ', 2, N'Bánh táo Mỹ với phần vỏ bánh mỏng, giòn mềm, ẩn chứa phần nhân táo thơm ngọt, điểm chút vị chua dịu của trái cây quả sẽ là một lựa chọn hoàn hảo cho những tín đồ bánh ngọt trên toàn thế giới.', 200000, 0, 'slide/1234.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(61, N'Bánh Cupcake - Anh Quốc', 6, N'Những chiếc cupcake có cấu tạo gồm phần vỏ bánh xốp mịn và phần kem trang trí bên trên rất bắt mắt với nhiều hình dạng và màu sắc khác nhau. Cupcake còn được cho là chiếc bánh mang lại niềm vui và tiếng cười như chính hình dáng đáng yêu của chúng.', 150000, 120000, 'slide/cupcake.jpg', 'cái', 1, NULL, NULL),
(62, N'Bánh Sachertorte', 6, N'Sachertorte là một loại bánh xốp được tạo ra bởi loại&nbsp;chocholate&nbsp;tuyệt hảo nhất của nước Áo. Sachertorte có vị ngọt nhẹ, gồm nhiều lớp bánh được làm từ ruột bánh mì và bánh sữa chocholate, xen lẫn giữa các lớp bánh là mứt mơ. Món bánh chocholate này nổi tiếng tới mức thành phố Vienna của Áo đã ấn định&nbsp;tổ chức một ngày Sachertorte quốc gia, vào 5/12 hằng năm', 250000, 220000, 'slide/111.jpg', 'cái', 0, NULL, NULL),
(64, N'Lê Đoàn Anh Quân', 6, 'quanchinhsdfdsfsd', 150000, 130000, 'slide/qQSNff84gQ074zG6cTLBDZEy7V5CkhMGneb6khSE.jpg', 'Hộp', 1, '2021-03-12 03:54:23', '2021-03-12 08:11:27');
INSERT INTO type_products (id, name_typepr,description_typepr,images,create_at,updated_at) VALUES
(1, N'Bánh mặn', N'Nếu từng bị mê hoặc bởi các loại tarlet ngọt thì chắn chắn bạn không thể bỏ qua những loại tarlet mặn. Ngoài hình dáng bắt mắt, lớp vở bánh giòn giòn cùng với nhân mặn như thịt gà, nấm, thị heo ,… của bánh sẽ chinh phục bất cứ ai dùng thử.', 'slide/banh-man-thu-vi-nhat-1.jpg', NULL, NULL),
(2, N'Bánh ngọt', N'Bánh ngọt là một loại thức ăn thường dưới hình thức món bánh dạng bánh mì từ bột nhào, được nướng lên dùng để tráng miệng. Bánh ngọt có nhiều loại, có thể phân loại dựa theo nguyên liệu và kỹ thuật chế biến như bánh ngọt làm từ lúa mì, bơ, bánh ngọt dạng bọt biển. Bánh ngọt có thể phục vụ những mục đính đặc biệt như bánh cưới, bánh sinh nhật, bánh Giáng sinh, bánh Halloween..', 'slide/20131108144733.jpg', '2016-10-12 02:16:15', '2016-10-13 01:38:35'),
(3, N'Bánh trái cây', N'Bánh trái cây, hay còn gọi là bánh hoa quả, là một món ăn chơi, không riêng gì của Huế nhưng khi \"lạc\" vào mảnh đất Cố đô, món bánh này dường như cũng mang chút tinh tế, cầu kỳ và đặc biệt. Lấy cảm hứng từ những loại trái cây trong vườn, qua bàn tay khéo léo của người phụ nữ Huế, món bánh trái cây ra đời - ngọt thơm, dịu nhẹ làm đẹp lòng biết bao người thưởng thức.', 'slide/banhtraicay.jpg', '2016-10-18 00:33:33', '2016-10-15 07:25:27'),
(4, N'Bánh kem', N'Với người Việt Nam thì bánh ngọt nói chung đều hay được quy về bánh bông lan – một loại tráng miệng bông xốp, ăn không hoặc được phủ kem lên thành bánh kem. Tuy nhiên, cốt bánh kem thực ra có rất nhiều loại với hương vị, kết cấu và phương thức làm khác nhau chứ không chỉ đơn giản là “bánh bông lan” chung chung đâu nhé!', 'slide/banhkem.jpg', '2016-10-26 03:29:19', '2016-10-26 02:22:22'),
(5, N'Bánh crepe', N'Crepe là một món bánh nổi tiếng của Pháp, nhưng từ khi du nhập vào Việt Nam món bánh đẹp mắt, ngon miệng này đã làm cho biết bao bạn trẻ phải “xiêu lòng”', 'slide/crepe-dao.jpg', '2016-10-28 04:00:00', '2016-10-27 04:00:23'),
(6, N'Bánh Pizza', N'Pizza đã không chỉ còn là một món ăn được ưa chuộng khắp thế giới mà còn được những nhà cầm quyền EU chứng nhận là một phần di sản văn hóa ẩm thực châu Âu. Và để được chứng nhận là một nhà sản xuất pizza không hề đơn giản. Người ta phải qua đủ mọi các bước xét duyệt của chính phủ Ý và liên minh châu Âu nữa… tất cả là để đảm bảo danh tiếng cho món ăn này.', 'slide/pizza-miami.jpg', '2016-10-25 17:19:00', NULL),
(7, N'Bánh su kem', N'Bánh su kem là món bánh ngọt ở dạng kem được làm từ các nguyên liệu như bột mì, trứng, sữa, bơ.... đánh đều tạo thành một hỗn hợp và sau đó bằng thao tác ép và phun qua một cái túi để định hình thành những bánh nhỏ và cuối cùng được nướng chín. Bánh su kem có thể thêm thành phần Sô cô la để tăng vị hấp dẫn. Bánh có xuất xứ từ nước Pháp.', 'slide/sukemdau.jpg', '2016-10-25 17:19:00', NULL);
INSERT INTO slide (id, link,image_sl) VALUES
(1, '', 'banner1.jpg'),
(2, '', 'banner2.jpg'),
(3, '', 'banner3.jpg'),
(4, '', 'banner4.jpg');