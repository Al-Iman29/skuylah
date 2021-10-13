CREATE TABLE user (
  id int NOT NULL AUTO_INCREMENT,
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO user VALUES (1,'admin','admin');

CREATE TABLE teacher (
  id int NOT NULL AUTO_INCREMENT,
  teacher_id int NOT NULL,
  password varchar(255) NOT NULL,
  teacher_name varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO teacher VALUES (1,123,'123','citta'),(2,234,'234','cahyono');

CREATE TABLE class (
  id int NOT NULL AUTO_INCREMENT,
  class_name varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO class VALUES (1,'class 1'),(2,'class 2');

CREATE TABLE lessons (
  id int NOT NULL AUTO_INCREMENT,
  teacher_id int NOT NULL,
  class_id int NOT NULL,
  material varchar(255) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_teacher
  FOREIGN KEY (teacher_id)
  REFERENCES teacher(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT fk_class
  FOREIGN KEY (class_id)
  REFERENCES class(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE student (
  id int NOT NULL AUTO_INCREMENT,
  student_id int NOT NULL,
  password varchar(255) NOT NULL,
  class_id int NOT NULL,
  student_name varchar(255) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_class
  FOREIGN KEY (class_id)
  REFERENCES class(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO student VALUES (1,123,'123',1,'tarul'),(2,234,'234',2,'zidane');

CREATE TABLE list_of_attendees (
  id int NOT NULL AUTO_INCREMENT,
  student_id int NOT NULL,
  lessons_id int NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_student
  FOREIGN KEY (student_id)
  REFERENCES student(student_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT fk_lessons
  FOREIGN KEY (lessons_id)
  REFERENCES lessons(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
