/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     13/08/2020 4:18:38:PM                        */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SESION') and o.name = 'FK_SESION_SESION_ENTRENAD')
alter table SESION
   drop constraint FK_SESION_SESION_ENTRENAD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SESION') and o.name = 'FK_SESION_SESION2_CLIENTE')
alter table SESION
   drop constraint FK_SESION_SESION2_CLIENTE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTE')
            and   type = 'U')
   drop table CLIENTE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ENTRENADOR')
            and   type = 'U')
   drop table ENTRENADOR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SESION')
            and   name  = 'SESION_FK'
            and   indid > 0
            and   indid < 255)
   drop index SESION.SESION_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SESION')
            and   name  = 'SESION2_FK'
            and   indid > 0
            and   indid < 255)
   drop index SESION.SESION2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SESION')
            and   type = 'U')
   drop table SESION
go

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           int                  not null,
   NOMBRE               varchar(40)          null,
   APELLIDO             varchar(40)          null,
   GENERO               varchar(3)           null,
   FECHA_NACIMIENTO     datetime             null,
   constraint PK_CLIENTE primary key nonclustered (ID_CLIENTE)
)
go

/*==============================================================*/
/* Table: ENTRENADOR                                            */
/*==============================================================*/
create table ENTRENADOR (
   ID_ENTRENADOR        int                  not null,
   NOMBRESENTRENADOR    varchar(40)          null,
   APELLIDOSENTRENADOR  varchar(40)          null,
   ESPECIALIDADES       varchar(50)          null,
   constraint PK_ENTRENADOR primary key nonclustered (ID_ENTRENADOR)
)
go

/*==============================================================*/
/* Table: SESION                                                */
/*==============================================================*/
create table SESION (
   ID_ENTRENADOR        int                  not null,
   ID_CLIENTE           int                  not null,
   FECHA                datetime             null,
   CALIFICACION         int                  null,
   OBSERVACIONES        varchar(50)          null,
   constraint PK_SESION primary key nonclustered (ID_ENTRENADOR, ID_CLIENTE)
)
go

/*==============================================================*/
/* Index: SESION2_FK                                            */
/*==============================================================*/
create index SESION2_FK on SESION (
ID_CLIENTE ASC
)
go

/*==============================================================*/
/* Index: SESION_FK                                             */
/*==============================================================*/
create index SESION_FK on SESION (
ID_ENTRENADOR ASC
)
go

alter table SESION
   add constraint FK_SESION_SESION_ENTRENAD foreign key (ID_ENTRENADOR)
      references ENTRENADOR (ID_ENTRENADOR)
go

alter table SESION
   add constraint FK_SESION_SESION2_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
go





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




