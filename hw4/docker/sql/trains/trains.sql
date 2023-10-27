CREATE TABLE "public.train" (
	"id" serial NOT NULL,
	"length" integer NOT NULL,
	CONSTRAINT "train_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.city" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"region" TEXT NOT NULL,
	CONSTRAINT "city_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.station" (
	"name" TEXT NOT NULL,
	"city_id" integer NOT NULL,
	"number_of_tracks" integer NOT NULL,
	CONSTRAINT "station_pk" PRIMARY KEY ("name")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.track" (
	"id" serial NOT NULL,
	"departure_station_name" TEXT NOT NULL,
	"arrival_station_name" TEXT NOT NULL,
	CONSTRAINT "track_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.route" (
	"id" serial NOT NULL,
	"track_id" integer NOT NULL,
	"train_id" integer NOT NULL,
	"departure" zone NOT NULL,
	"arrival" zone NOT NULL,
	CONSTRAINT "route_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "station" ADD CONSTRAINT "station_fk0" FOREIGN KEY ("city_id") REFERENCES "city"("id");

ALTER TABLE "track" ADD CONSTRAINT "track_fk0" FOREIGN KEY ("departure_station_name") REFERENCES "station"("name");
ALTER TABLE "track" ADD CONSTRAINT "track_fk1" FOREIGN KEY ("arrival_station_name") REFERENCES "station"("name");

ALTER TABLE "route" ADD CONSTRAINT "route_fk0" FOREIGN KEY ("track_id") REFERENCES "track"("id");
ALTER TABLE "route" ADD CONSTRAINT "route_fk1" FOREIGN KEY ("train_id") REFERENCES "train"("id");
