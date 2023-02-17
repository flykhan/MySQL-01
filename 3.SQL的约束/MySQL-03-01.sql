CREATE DATABASE mysql_shiyan;

use mysql_shiyan;

CREATE TABLE department
(
  dpt_name   CHAR(20) NOT NULL,
-- DEFAULT 默认值约束,当 DEFAULT 约束的列,插入数据为空时,将使用默认值
  people_num INT(10) DEFAULT '10',
/*  
PRIMARY KEY 主键,作为数据表中一行数据的唯一标识符,在一张表中通过主键就能准确定位到某一行
数据,他不能有重复记录且不能为空
*/
  CONSTRAINT dpt_pk PRIMARY KEY (dpt_name)
 );

CREATE TABLE employee
(
  id      INT(10) PRIMARY KEY,
  name    CHAR(20),
  age     INT(10),
--NOT NULL 非空约束,在插入值时必须非空
  salary  INT(10) NOT NULL,
  phone   INT(12) NOT NULL,
  in_dpt  CHAR(20) NOT NULL,
/*  
UNIQUE 唯一约束,规定表中指定的列的值必须不能重复,这一列每一个值都是唯一的
当 INSERT 插入新的数据和已有数据重复的时候,如果有 UNIQUE 约束,则 INSERT 失败
*/
  UNIQUE  (phone),
/*  
FOREIGN KEY 外键,既能确保数据完整性,也能表现表之间的关系。
INSERT 时,如果被外键约束的值没有在参考列中有对应,则 INSERT 失败
  */
  CONSTRAINT emp_fk FOREIGN KEY (in_dpt) REFERENCES department(dpt_name)
 );
 
CREATE TABLE project
(
  proj_num   INT(10) NOT NULL,
  proj_name  CHAR(20) NOT NULL,
  start_date DATE NOT NULL,
  end_date   DATE DEFAULT '2015-04-01',
  of_dpt     CHAR(20) REFERENCES department(dpt_name),
  CONSTRAINT proj_pk PRIMARY KEY (proj_num,proj_name)
 );
