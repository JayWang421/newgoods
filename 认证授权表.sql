use mygoods ;
create table goods_manage(
	gid	varchar(50) not null ,
	name	varchar(50) ,
	password	varchar(32) ,
	locked	int ,
	constraint pk_gid primary key(gid)
) engine='innodb' ;
create table role(
	rid	varchar(50) ,
	title	varchar(200) ,
	constraint pk_rid primary key(rid)
) engine='innodb' ;
create table action(
	actid	varchar(50) ,
	title	varchar(200) ,
	rid	varchar(50) ,
	constraint pk_actid primary key(actid) ,
	constraint fk_rid1 foreign key(rid) references role(rid)
) engine='innodb' ;
create table goods_role(
	gid	varchar(50) ,
	rid	varchar(50) ,
	constraint fk_mid2 foreign key(gid) references goods_manage(gid),
	constraint fk_rid2 foreign key(rid) references role(rid)
) engine='innodb' ;
-- 0表示活跃、1表示锁定
INSERT INTO goods_manage(gid,name,password,locked) VALUES ('admin','管理员','hello',0) ;
-- 定义角色信息
INSERT INTO role(rid,title) VALUES ('goods','商品管理') ;
-- 定义权限信息
INSERT INTO action(actid,title,rid) VALUES ('goods:add','商品追加','goods') ;
INSERT INTO action(actid,title,rid) VALUES ('goods:list','商品列表','goods') ;
INSERT INTO action(actid,title,rid) VALUES ('goods:edit','商品编辑','goods') ;
INSERT INTO action(actid,title,rid) VALUES ('goods:remove','商品删除','goods') ;
-- 定义用户与角色的关系
INSERT INTO goods_role(gid,rid) VALUES ('admin','goods') ;