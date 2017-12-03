create table `Rule` (
    `id` int primary key auto_increment,
    `name` varchar(500) not null,
    `zhuzheng` varchar(500) not null,
	  `cizheng` varchar(500) not null,
    `zhushezhi` varchar(500) not null,
    `cishezhi` varchar(500) not null,
    `zhushetai` varchar(500) not null,
    `cishetai` varchar(500) not null,
    `zhumai` varchar(500) not null,
    `cimai` varchar(500) not null
);

create table `User` (
    `id` int primary key auto_increment,
    `userName` varchar(500) not null,
    `userPassword` varchar(500) not null,
	  `realName` varchar(500),
    `userAge` int,
    `userAddr` varchar(500)
);

create table `Discase` (
    `id` int primary key auto_increment,
    `info` varchar(500) not null,
    `medicalHis` varchar(500) not null,
	  `examine` varchar(500),
    `disease` varchar(500)
);


ALTER TABLE rule auto_increment=1;
ALTER TABLE user auto_increment=1;
ALTER TABLE discase auto_increment=1;

SHOW INDEX from Rule;
DROP INDEX zsc ON Rule;
ALTER TABLE Discase ADD INDEX zsc (id);
ALTER TABLE questionr engine=myisam;
ALTER TABLE questionr auto_increment=1;
ALTER TABLE peopler auto_increment=1;
ALTER TABLE topicr auto_increment=1;
