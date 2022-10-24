CREATE TABLE "public.Authentication" (
	"User_id" serial NOT NULL,
	"email" serial(255) NOT NULL,
	"password" serial(255) NOT NULL,
	"DOB" serial NOT NULL,
	"phone_number" serial(11) NOT NULL,
	CONSTRAINT "Authentication_pk" PRIMARY KEY ("User_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Users (dashboard)" (
	"user_id" serial NOT NULL,
	"first_name" serial(255) NOT NULL,
	"last_name" serial(255) NOT NULL,
	"username" serial(255) NOT NULL,
	"email" serial(255) NOT NULL,
	"picture" serial NOT NULL,
	"payrate" serial(255) NOT NULL,
	CONSTRAINT "Users (dashboard)_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Clock in/out" (
	"clock(in/out)_id" serial(255) NOT NULL,
	"clock(out)_id" serial(255) NOT NULL,
	"user_id" serial NOT NULL,
	CONSTRAINT "Clock in/out_pk" PRIMARY KEY ("clock(in/out)_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Check weekly Hours" (
	"user_id" serial NOT NULL,
	"weekly(hrs)_id" serial NOT NULL,
	"date" serial NOT NULL,
	CONSTRAINT "Check weekly Hours_pk" PRIMARY KEY ("weekly(hrs)_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Clock Out daily time" (
	"dailytime_id" serial NOT NULL,
	"timestamp_total" serial NOT NULL,
	"date" serial NOT NULL,
	"clock(out)_id" serial NOT NULL,
	CONSTRAINT "Clock Out daily time_pk" PRIMARY KEY ("dailytime_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Edit user Info list" (
	"edituser_id" serial NOT NULL,
	"email" serial(255) NOT NULL,
	"password" serial(255) NOT NULL,
	"DOB" serial(255) NOT NULL,
	"phone_number" serial(11) NOT NULL,
	"edituserinfo_id" serial NOT NULL,
	"save_id" serial NOT NULL,
	CONSTRAINT "Edit user Info list_pk" PRIMARY KEY ("edituser_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Edit user info" (
	"edituserinfo_id" serial NOT NULL,
	"editinfo_id" serial NOT NULL,
	"user_id" serial NOT NULL,
	CONSTRAINT "Edit user info_pk" PRIMARY KEY ("edituserinfo_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Weekly hours and Pay total" (
	"hoursandpay_id" serial NOT NULL,
	"payrate_total" serial NOT NULL,
	"weekly(hrs)_id" serial NOT NULL,
	"time" serial NOT NULL,
	CONSTRAINT "Weekly hours and Pay total_pk" PRIMARY KEY ("hoursandpay_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Admin User" (
	"adminuser_id" serial NOT NULL,
	"first_name" serial(255) NOT NULL,
	"last_name" serial(255) NOT NULL,
	"username" serial(255) NOT NULL,
	"email" serial(255) NOT NULL,
	"picture" serial NOT NULL,
	"payrate" serial(255) NOT NULL,
	"employeelist_id" serial(255) NOT NULL,
	CONSTRAINT "Admin User_pk" PRIMARY KEY ("adminuser_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Edit hours" (
	"employeelist_id" varchar(255) NOT NULL,
	"hoursedit_id" serial(255) NOT NULL,
	"time" serial(255) NOT NULL,
	"save_id" serial(255) NOT NULL,
	CONSTRAINT "Edit hours_pk" PRIMARY KEY ("hoursedit_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Employees list" (
	"employeelist_id" serial(255) NOT NULL,
	"editemployees(hrs)_id" serial(255) NOT NULL,
	"edit_id" serial(255) NOT NULL,
	"user_id" serial(255) NOT NULL,
	CONSTRAINT "Employees list_pk" PRIMARY KEY ("employeelist_id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Authentication" ADD CONSTRAINT "Authentication_fk0" FOREIGN KEY ("User_id") REFERENCES "Users (dashboard)"("user_id");


ALTER TABLE "Clock in/out" ADD CONSTRAINT "Clock in/out_fk0" FOREIGN KEY ("clock(in/out)_id") REFERENCES "Clock Out daily time"("dailytime_id");
ALTER TABLE "Clock in/out" ADD CONSTRAINT "Clock in/out_fk1" FOREIGN KEY ("user_id") REFERENCES "Users (dashboard)"("user_id");

ALTER TABLE "Check weekly Hours" ADD CONSTRAINT "Check weekly Hours_fk0" FOREIGN KEY ("user_id") REFERENCES "Users (dashboard)"("user_id");
ALTER TABLE "Check weekly Hours" ADD CONSTRAINT "Check weekly Hours_fk1" FOREIGN KEY ("weekly(hrs)_id") REFERENCES "Weekly hours and Pay total"("hoursandpay_id");


ALTER TABLE "Edit user Info list" ADD CONSTRAINT "Edit user Info list_fk0" FOREIGN KEY ("edituserinfo_id") REFERENCES "Edit user info"("edituserinfo_id");

ALTER TABLE "Edit user info" ADD CONSTRAINT "Edit user info_fk0" FOREIGN KEY ("edituserinfo_id") REFERENCES "Edit user Info list"("edituser_id");
ALTER TABLE "Edit user info" ADD CONSTRAINT "Edit user info_fk1" FOREIGN KEY ("editinfo_id") REFERENCES "Edit user Info list"("edituser_id");
ALTER TABLE "Edit user info" ADD CONSTRAINT "Edit user info_fk2" FOREIGN KEY ("user_id") REFERENCES "Users (dashboard)"("user_id");


ALTER TABLE "Admin User" ADD CONSTRAINT "Admin User_fk0" FOREIGN KEY ("adminuser_id") REFERENCES "Authentication"("User_id");
ALTER TABLE "Admin User" ADD CONSTRAINT "Admin User_fk1" FOREIGN KEY ("employeelist_id") REFERENCES "Employees list"("employeelist_id");


ALTER TABLE "Employees list" ADD CONSTRAINT "Employees list_fk0" FOREIGN KEY ("employeelist_id") REFERENCES "Edit hours"("employeelist_id");
ALTER TABLE "Employees list" ADD CONSTRAINT "Employees list_fk1" FOREIGN KEY ("edit_id") REFERENCES "Edit hours"("employeelist_id");
ALTER TABLE "Employees list" ADD CONSTRAINT "Employees list_fk2" FOREIGN KEY ("user_id") REFERENCES "Users (dashboard)"("user_id");











