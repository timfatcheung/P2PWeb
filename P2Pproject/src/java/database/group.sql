create table GroupList(
Group_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
GroupName VARCHAR(30) NOT NULL,
Member1 VARCHAR(30),
Member2 VARCHAR(30),
Member3 VARCHAR(30),
Member4 VARCHAR(30),
Member5 VARCHAR(30),
CONSTRAINT Group_id_pk PRIMARY KEY (Group_id)
);
