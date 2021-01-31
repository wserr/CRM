CREATE TABLE public.Payments (
    id serial primary key,
    timestamp timestamp NOT NULL,
    amount decimal NOT NULL,
    studentid int NOT null,
	constraint payments_studentid_student
		foreign key(studentid)
		references students(id)
		on delete cascade
);