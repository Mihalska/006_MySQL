use MyJoinsDB;

/* в попередніх завданнях ми використовували кластеризовані індекси (id), які виступали PRIMARY KEY.
Відповідно сортування відбувалося по  id. Проте іноді, може виникнути необхідність, наприклад, відсортувати 
за прізвищами в алфавітному порядку. Ми це можемо зробити зробити за допомогою некластеризованого індекса. 
Сортування відбудеться за алфавітним порядком, навіть при наявності PRIMARY KEY (кластеризованого індексу), 
так як некластеризований індекс є в пріоритететі виконання.*/

create table Employees
(Employees_id int  not null ,
LName VARCHAR(50) NOT NULL ,
FName VARCHAR(50) NOT NULL ,
MName VARCHAR(50) NOT NULL ,
phone varchar(30) NOT NULL 
);

/* створення некластеризованого індекса вручну*/
CREATE INDEX idx_pname
ON Employees (LName, FName,MName,phone );

ALTER TABLE Employees ADD 
	CONSTRAINT PK_Employees PRIMARY KEY(Employees_id) ;
    drop table Employees;

insert into Employees
( Employees_id, LName, FName, MName, phone )
 values 
(1, 'Іваненко', 'Іван', 'Іванович', '(093)025-41-45'),
(2, 'Шевченко', 'Олег', 'Іванович', '(095)825-46-69'),
(3, 'Ященко', 'Артем', 'Юрійович',  '(067)025-21-49'),  
(4, 'Кучера', 'Олена', 'Ігорівна',  '(097)036-41-87'); 
select * from Employees;
   
 /* в наступній таблиці вирішили відсотувати за посадою (така необхідність теж може виникнути). 
 Аналогічно скористались створенням вручну некластеризованого індексу idx_pname1 при існуючому також кластеризованому.  */   
create table Salaryes
(salaryes_id int NOT NULL ,
position VARCHAR(50) NOT NULL,
salary int NOT NULL
);

CREATE INDEX idx_pname1
ON Salaryes (position, salary );

ALTER TABLE Salaryes ADD 
	CONSTRAINT PK_Salaryes PRIMARY KEY(salaryes_id) ;
    
ALTER TABLE Salaryes ADD CONSTRAINT
FK_Salaryes_Salaryes FOREIGN KEY(salaryes_id) 
	REFERENCES Employees(Employees_id)  ;
    
insert into Salaryes
( salaryes_id, position, salary)
 values  
 (1, 'Головний директор', 30000),
 (2, 'Менеджер', 20000),
 (3, 'Головний робітник', 15000), /*трохи змінили дані, щоб чітко бачити чи відбулось необхідне сортування  */
 (4, 'Робітник', 13000);
 
 select * from Salaryes;
 drop table Salaryes;
 
/* в наступній таблиці використовуючи некластеризований індекс сортуємо по статусу - 
спочатку неодружені, а потім одружені.*/   
create table Informations
(informations_id int NOT NULL ,
status VARCHAR(50) NOT NULL,
birthday date NOT NULL,
adress VARCHAR(50) NOT NULL
);

CREATE INDEX idx_pname2
ON Informations (status, birthday, adress );

ALTER TABLE Informations ADD 
	CONSTRAINT PK_Informations PRIMARY KEY(informations_id) ;
    
ALTER TABLE Informations ADD CONSTRAINT
FK_Informations_Informations FOREIGN KEY(informations_id) 
	REFERENCES Employees(Employees_id)  ;
   
   insert into Informations
   (informations_id, status, birthday, adress)
   values
   (1, 'Неодружений', '1985-11-25', 'вул. Васильківська, 35'),
   (2, 'Одружений', '1986-01-15', 'вул. Миру, 100'),
   (3, 'Неодружений', '1987-07-06', 'вул. Перемоги, 31/112'),
   (4, 'Одружений', '1988-05-11', 'вул. Хрещатик, 45/100');
   select * from Informations;
   drop table Informations;
   /*У нашому випадку за допомогою PRIMARY KEY (id) відбувався звязок з таблицями, були зовнішні ключі - 
   порушувати ці зв'язки ми не могли,але і не завжди необхідно сортування за id, 
   Саме тому доцільно використовувати некластеризовані індекси.*/
   
   
   
   
   