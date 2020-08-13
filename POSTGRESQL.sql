/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     13/08/2020 4:31:13:PM                        */
/*==============================================================*/


drop index CLIENTE_PK;

drop table CLIENTE;

drop index ENTRENADOR_PK;

drop table ENTRENADOR;

drop index SESION_FK;

drop index SESION2_FK;

drop index SESION_PK;

drop table SESION;

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           INT4                 not null,
   NOMBRE               VARCHAR(40)          null,
   APELLIDO             VARCHAR(40)          null,
   GENERO               VARCHAR(3)           null,
   FECHA_NACIMIENTO     DATE                 null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: ENTRENADOR                                            */
/*==============================================================*/
create table ENTRENADOR (
   ID_ENTRENADOR        INT4                 not null,
   NOMBRESENTRENADOR    VARCHAR(40)          null,
   APELLIDOSENTRENADOR  VARCHAR(40)          null,
   ESPECIALIDADES       VARCHAR(50)          null,
   constraint PK_ENTRENADOR primary key (ID_ENTRENADOR)
);

/*==============================================================*/
/* Index: ENTRENADOR_PK                                         */
/*==============================================================*/
create unique index ENTRENADOR_PK on ENTRENADOR (
ID_ENTRENADOR
);

/*==============================================================*/
/* Table: SESION                                                */
/*==============================================================*/
create table SESION (
   ID_ENTRENADOR        INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   FECHA                DATE                 null,
   CALIFICACION         INT4                 null,
   OBSERVACIONES        VARCHAR(50)          null,
   constraint PK_SESION primary key (ID_ENTRENADOR, ID_CLIENTE)
);

/*==============================================================*/
/* Index: SESION_PK                                             */
/*==============================================================*/
create unique index SESION_PK on SESION (
ID_ENTRENADOR,
ID_CLIENTE
);

/*==============================================================*/
/* Index: SESION2_FK                                            */
/*==============================================================*/
create  index SESION2_FK on SESION (
ID_CLIENTE
);

/*==============================================================*/
/* Index: SESION_FK                                             */
/*==============================================================*/
create  index SESION_FK on SESION (
ID_ENTRENADOR
);

alter table SESION
   add constraint FK_SESION_SESION_ENTRENAD foreign key (ID_ENTRENADOR)
      references ENTRENADOR (ID_ENTRENADOR)
      on delete restrict on update restrict;

alter table SESION
   add constraint FK_SESION_SESION2_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;


/*==============================================================*/
/* INSERSION                                                    */
/*==============================================================*/

insert into CLIENTE (ID_CLIENTE, NOMBRE, APELLIDO, GENERO, FECHA_NACIMIENTO) values (1, 'JUAN CARLOS', 'PEREZ PEREZ', 'M', '1222-10-18 8:45:20');

insert into CLIENTE (ID_CLIENTE, NOMBRE, APELLIDO, GENERO, FECHA_NACIMIENTO) values (2, 'YETZENIA MATILDE', 'GARCIA GARCIA', 'F', '1794-12-6 12:52:4');

insert into CLIENTE (ID_CLIENTE, NOMBRE, APELLIDO, GENERO, FECHA_NACIMIENTO) values (3, 'MESLI YELITZA', 'ZAMBRANO COBEÑA', 'F', '1727-7-14 12:22:38');


insert into ENTRENADOR (ID_ENTRENADOR, NOMBRESENTRENADOR, APELLIDOSENTRENADOR, ESPECIALIDADES) values (1, 'MICHAEL JORDAN', 'GALLEGOS GARCIA', '74AG1BUNI9YNT1O12ICF8KC6 RWBAMUV X618O UXUTV3HS28K');

insert into ENTRENADOR (ID_ENTRENADOR, NOMBRESENTRENADOR, APELLIDOSENTRENADOR, ESPECIALIDADES) values (2, 'JODAN JESUS', 'GALLEGOS MACIAS', 'C6B6G340NTAPFRBXQHS BXX9F6A2D59M3UPXY7DYALN9JA1TX0');

insert into ENTRENADOR (ID_ENTRENADOR, NOMBRESENTRENADOR, APELLIDOSENTRENADOR, ESPECIALIDADES) values (3, 'DAVID JOSUE', 'GALLEGOS DELGADO', '494K9R1YTLCVBUB02KB7Q82EJ6YWK2 WGI1FHAGV9BPGFMHEDE');


insert into SESION (ID_ENTRENADOR, ID_CLIENTE, FECHA, CALIFICACION, OBSERVACIONES) values (1, 2, '1416-7-15 13:43:14', 4, 'J8NEEQ1TG527VYNFXI1NTHQS7HUJI54CKGF5IC3IDGPDVMPBBV');

insert into SESION (ID_ENTRENADOR, ID_CLIENTE, FECHA, CALIFICACION, OBSERVACIONES) values (2, 1, '1526-6-21 14:53:0', 19, 'NR EE0MCUNRVLSNJLJRYJSAA0KVD20VT81F1YGOVP967MI7DS6');

insert into SESION (ID_ENTRENADOR, ID_CLIENTE, FECHA, CALIFICACION, OBSERVACIONES) values (3, 3, '121-9-4 0:35:29', 16, 'R4X7 Q6HUM3UWPTOUQMKH5L7EQQ6DVFV8 9 SS87W4GWC0B50B');




