CREATE TABLE "public.station" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "station_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.room" (
	"id" serial NOT NULL,
	"station_id" integer NOT NULL,
	"room_number" integer NOT NULL,
	"amount_of_beds" integer NOT NULL,
	CONSTRAINT "room_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.personnel" (
	"id" serial NOT NULL,
	"station_id" integer NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "personnel_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.caregiver" (
	"personnel_id" integer NOT NULL,
	"qualification" TEXT NOT NULL,
	CONSTRAINT "caregiver_pk" PRIMARY KEY ("personnel_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.doctor" (
	"personnel_id" integer NOT NULL,
	"area" TEXT NOT NULL,
	"rank" TEXT NOT NULL,
	CONSTRAINT "doctor_pk" PRIMARY KEY ("personnel_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.patient" (
	"id" serial NOT NULL,
	"doctor_id" integer NOT NULL,
	"name" TEXT NOT NULL,
	"disease" TEXT NOT NULL,
	CONSTRAINT "patient_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.admission" (
	"id" serial NOT NULL,
	"patient_id" integer NOT NULL,
	"from_room_id" integer NOT NULL,
	"to_room_id" integer NOT NULL,
	CONSTRAINT "admission_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "room" ADD CONSTRAINT "room_fk0" FOREIGN KEY ("station_id") REFERENCES "station"("id");

ALTER TABLE "personnel" ADD CONSTRAINT "personnel_fk0" FOREIGN KEY ("station_id") REFERENCES "station"("id");

ALTER TABLE "caregiver" ADD CONSTRAINT "caregiver_fk0" FOREIGN KEY ("personnel_id") REFERENCES "personnel"("id");

ALTER TABLE "doctor" ADD CONSTRAINT "doctor_fk0" FOREIGN KEY ("personnel_id") REFERENCES "personnel"("id");

ALTER TABLE "patient" ADD CONSTRAINT "patient_fk0" FOREIGN KEY ("doctor_id") REFERENCES "doctor"("personnel_id");

ALTER TABLE "admission" ADD CONSTRAINT "admission_fk0" FOREIGN KEY ("patient_id") REFERENCES "patient"("id");
ALTER TABLE "admission" ADD CONSTRAINT "admission_fk1" FOREIGN KEY ("from_room_id") REFERENCES "room"("id");
ALTER TABLE "admission" ADD CONSTRAINT "admission_fk2" FOREIGN KEY ("to_room_id") REFERENCES "room"("id");
