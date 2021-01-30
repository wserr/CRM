CREATE TABLE public.Students (
    Id serial primary key,
    Name text NOT NULL,
    FirstName text NOT NULL,
    Mobile text NOT NULL,
    Email text NOT NULL
);

CREATE TABLE public.ToDoItems (
    Id serial primary key,
    Title text NOT NULL,
    Description text NOT NULL,
    IsDone boolean NOT NULL
);
