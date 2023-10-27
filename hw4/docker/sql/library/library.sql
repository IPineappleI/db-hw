CREATE TABLE "public.book" (
	"isbn" integer NOT NULL,
	"publisher_name" TEXT NOT NULL,
	"year" integer NOT NULL,
	"name" TEXT NOT NULL,
	"author_name" TEXT NOT NULL,
	"page_count" integer NOT NULL,
	CONSTRAINT "book_pk" PRIMARY KEY ("isbn")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.publisher" (
	"name" TEXT NOT NULL,
	"address" TEXT NOT NULL,
	CONSTRAINT "publisher_pk" PRIMARY KEY ("name")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.category" (
	"name" TEXT NOT NULL,
	"parent_name" TEXT NOT NULL,
	CONSTRAINT "category_pk" PRIMARY KEY ("name")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.includes" (
	"category_name" TEXT NOT NULL,
	"book_isbn" integer NOT NULL,
	CONSTRAINT "includes_pk" PRIMARY KEY ("category_name","book_isbn")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.copy" (
	"id" integer NOT NULL,
	"book_isbn" integer NOT NULL,
	"shelf" integer NOT NULL,
	"position" integer NOT NULL,
	CONSTRAINT "copy_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.reader" (
	"id" serial NOT NULL,
	"last_name" TEXT NOT NULL,
	"first_name" TEXT NOT NULL,
	"address" TEXT NOT NULL,
	"birthday" DATE NOT NULL,
	CONSTRAINT "reader_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.borrowing" (
	"id" serial NOT NULL,
	"reader_id" integer NOT NULL,
	"copy_id" integer NOT NULL,
	"return_date" DATE NOT NULL,
	CONSTRAINT "borrowing_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "book" ADD CONSTRAINT "book_fk0" FOREIGN KEY ("publisher_name") REFERENCES "publisher"("name");

ALTER TABLE "category" ADD CONSTRAINT "category_fk0" FOREIGN KEY ("parent_name") REFERENCES "category"("name");

ALTER TABLE "includes" ADD CONSTRAINT "includes_fk0" FOREIGN KEY ("category_name") REFERENCES "category"("name");
ALTER TABLE "includes" ADD CONSTRAINT "includes_fk1" FOREIGN KEY ("book_isbn") REFERENCES "book"("isbn");

ALTER TABLE "copy" ADD CONSTRAINT "copy_fk0" FOREIGN KEY ("book_isbn") REFERENCES "book"("isbn");

ALTER TABLE "borrowing" ADD CONSTRAINT "borrowing_fk0" FOREIGN KEY ("reader_id") REFERENCES "reader"("id");
ALTER TABLE "borrowing" ADD CONSTRAINT "borrowing_fk1" FOREIGN KEY ("copy_id") REFERENCES "copy"("id");
