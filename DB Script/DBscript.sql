SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `happytrip_itr1` DEFAULT CHARACTER SET latin1 ;
USE `happytrip_itr1` ;

-- -----------------------------------------------------
-- Table `happytrip_itr1`.`airlinereport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`airlinereport` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`airlinereport` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `airlinecode` VARCHAR(255) NULL DEFAULT NULL ,
  `airlinelogo` VARCHAR(255) NULL DEFAULT NULL ,
  `airlinename` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`airlines`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`airlines` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`airlines` (
  `airlineid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `airlinecode` VARCHAR(255) NULL DEFAULT NULL ,
  `airlinelogo` VARCHAR(255) NULL DEFAULT NULL ,
  `airlinename` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`airlineid`) )
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`backup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`backup` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`backup` (
  `backupid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `data` LONGBLOB NULL DEFAULT NULL ,
  `name` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`backupid`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`bookingcancelations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`bookingcancelations` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`bookingcancelations` (
  `bookingid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `cancelationdate` DATETIME NULL DEFAULT NULL ,
  `refundamount` FLOAT NULL DEFAULT NULL ,
  PRIMARY KEY (`bookingid`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`states`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`states` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`states` (
  `stateid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `statename` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`stateid`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`cities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`cities` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`cities` (
  `cityid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `cityname` VARCHAR(255) NULL DEFAULT NULL ,
  `stateid` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`cityid`) ,
  INDEX `FKAEEDBB4927C020C2` (`stateid` ASC) ,
  CONSTRAINT `FKAEEDBB4927C020C2`
    FOREIGN KEY (`stateid` )
    REFERENCES `happytrip_itr1`.`states` (`stateid` ))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`bookingcontacts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`bookingcontacts` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`bookingcontacts` (
  `bookingid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `address` VARCHAR(255) NULL DEFAULT NULL ,
  `contactname` VARCHAR(255) NULL DEFAULT NULL ,
  `email` VARCHAR(255) NULL DEFAULT NULL ,
  `mobileno` VARCHAR(255) NULL DEFAULT NULL ,
  `phoneno` VARCHAR(255) NULL DEFAULT NULL ,
  `pincode` VARCHAR(255) NULL DEFAULT NULL ,
  `cityid` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`bookingid`) ,
  INDEX `FK864AFFAC824839CC` (`cityid` ASC) ,
  CONSTRAINT `FK864AFFAC824839CC`
    FOREIGN KEY (`cityid` )
    REFERENCES `happytrip_itr1`.`cities` (`cityid` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`bookingpayments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`bookingpayments` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`bookingpayments` (
  `bookingid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `paymentamount` FLOAT NULL DEFAULT NULL ,
  `paymentdate` DATETIME NULL DEFAULT NULL ,
  `referenceno` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`bookingid`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`bookingreport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`bookingreport` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`bookingreport` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `costperticket` FLOAT NULL DEFAULT NULL ,
  `dateofjourney` DATETIME NULL DEFAULT NULL ,
  `numberofseats` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`users` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`users` (
  `user_id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `createddate` VARCHAR(45) NULL DEFAULT NULL ,
  `dateofbirth` VARCHAR(45) NULL DEFAULT NULL ,
  `username` VARCHAR(255) NULL DEFAULT NULL ,
  `enabled` BIT(1) NOT NULL ,
  `fullname` VARCHAR(255) NULL DEFAULT NULL ,
  `gender` VARCHAR(255) NULL DEFAULT NULL ,
  `loginid` VARCHAR(255) NULL DEFAULT NULL ,
  `password` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`user_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`bookingtypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`bookingtypes` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`bookingtypes` (
  `typeid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`typeid`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`bookings` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`bookings` (
  `bookingid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `bookingdate` VARCHAR(255) NULL DEFAULT NULL ,
  `bookingreferenceno` VARCHAR(255) NULL DEFAULT NULL ,
  `iscanceled` TINYINT(4) NULL DEFAULT NULL ,
  `remarks` VARCHAR(255) NULL DEFAULT NULL ,
  `totalcost` FLOAT NULL DEFAULT NULL ,
  `bookerid` BIGINT(20) NULL DEFAULT NULL ,
  `typeid` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`bookingid`) ,
  INDEX `FK7786033A4AE6D557` (`bookerid` ASC) ,
  INDEX `FK7786033AE232700D` (`typeid` ASC) ,
  CONSTRAINT `FK7786033A4AE6D557`
    FOREIGN KEY (`bookerid` )
    REFERENCES `happytrip_itr1`.`users` (`user_id` ),
  CONSTRAINT `FK7786033AE232700D`
    FOREIGN KEY (`typeid` )
    REFERENCES `happytrip_itr1`.`bookingtypes` (`typeid` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`classes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`classes` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`classes` (
  `classid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `classtype` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`classid`) )
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`flights`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`flights` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`flights` (
  `flightid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `flightname` VARCHAR(255) NULL DEFAULT NULL ,
  `airlineid` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`flightid`) ,
  INDEX `FKD1FF0A0392AB9C` (`airlineid` ASC) ,
  CONSTRAINT `FKD1FF0A0392AB9C`
    FOREIGN KEY (`airlineid` )
    REFERENCES `happytrip_itr1`.`airlines` (`airlineid` ))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`routes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`routes` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`routes` (
  `routeid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `fromcityid` BIGINT(20) NULL DEFAULT NULL ,
  `tocityid` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`routeid`) ,
  INDEX `FKC8DB974A6EAE69F6` (`fromcityid` ASC) ,
  INDEX `FKC8DB974A84244007` (`tocityid` ASC) ,
  CONSTRAINT `FKC8DB974A84244007`
    FOREIGN KEY (`tocityid` )
    REFERENCES `happytrip_itr1`.`cities` (`cityid` ),
  CONSTRAINT `FKC8DB974A6EAE69F6`
    FOREIGN KEY (`fromcityid` )
    REFERENCES `happytrip_itr1`.`cities` (`cityid` ))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`flight_routes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`flight_routes` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`flight_routes` (
  `flightid` BIGINT(20) NOT NULL ,
  `routeid` BIGINT(20) NOT NULL ,
  PRIMARY KEY (`flightid`, `routeid`) ,
  INDEX `FK5AA131F9EB5B6E32` (`routeid` ASC) ,
  INDEX `FK5AA131F9D8F7A7D6` (`flightid` ASC) ,
  CONSTRAINT `FK5AA131F9D8F7A7D6`
    FOREIGN KEY (`flightid` )
    REFERENCES `happytrip_itr1`.`flights` (`flightid` ),
  CONSTRAINT `FK5AA131F9EB5B6E32`
    FOREIGN KEY (`routeid` )
    REFERENCES `happytrip_itr1`.`routes` (`routeid` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`flightroutes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`flightroutes` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`flightroutes` (
  `flightrouteid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `arrivaltime` VARCHAR(255) NULL DEFAULT NULL ,
  `departuretime` VARCHAR(255) NULL DEFAULT NULL ,
  `distanceinkms` INT(11) NULL DEFAULT NULL ,
  `durationinmins` INT(11) NULL DEFAULT NULL ,
  `flightnumber` VARCHAR(255) NULL DEFAULT NULL ,
  `flightid` BIGINT(20) NULL DEFAULT NULL ,
  `routeid` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`flightrouteid`) ,
  INDEX `FKAF9407BAEB5B6E32` (`routeid` ASC) ,
  INDEX `FKAF9407BAD8F7A7D6` (`flightid` ASC) ,
  CONSTRAINT `FKAF9407BAD8F7A7D6`
    FOREIGN KEY (`flightid` )
    REFERENCES `happytrip_itr1`.`flights` (`flightid` ),
  CONSTRAINT `FKAF9407BAEB5B6E32`
    FOREIGN KEY (`routeid` )
    REFERENCES `happytrip_itr1`.`routes` (`routeid` ))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`scheduledflight`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`scheduledflight` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`scheduledflight` (
  `scheduledflightdate` VARCHAR(255) NULL DEFAULT NULL ,
  `flightrouteid` BIGINT(20) NOT NULL ,
  PRIMARY KEY (`flightrouteid`) ,
  INDEX `FK5A634F5D8A21F572` (`flightrouteid` ASC) ,
  CONSTRAINT `FK5A634F5D8A21F572`
    FOREIGN KEY (`flightrouteid` )
    REFERENCES `happytrip_itr1`.`flightroutes` (`flightrouteid` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`flightbookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`flightbookings` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`flightbookings` (
  `bookingid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `costperticket` FLOAT NULL DEFAULT NULL ,
  `dateofjourney` VARCHAR(255) NULL DEFAULT NULL ,
  `noofseats` INT(11) NULL DEFAULT NULL ,
  `classid` BIGINT(20) NULL DEFAULT NULL ,
  `flightrouteid` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`bookingid`) ,
  INDEX `FK91E417AA79413680` (`classid` ASC) ,
  INDEX `FK91E417AAB7BFA2B6` (`flightrouteid` ASC) ,
  INDEX `FK91E417AA8A21F572` (`flightrouteid` ASC) ,
  CONSTRAINT `FK91E417AA79413680`
    FOREIGN KEY (`classid` )
    REFERENCES `happytrip_itr1`.`classes` (`classid` ),
  CONSTRAINT `FK91E417AA8A21F572`
    FOREIGN KEY (`flightrouteid` )
    REFERENCES `happytrip_itr1`.`flightroutes` (`flightrouteid` ),
  CONSTRAINT `FK91E417AAB7BFA2B6`
    FOREIGN KEY (`flightrouteid` )
    REFERENCES `happytrip_itr1`.`scheduledflight` (`flightrouteid` ))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`flightcapacity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`flightcapacity` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`flightcapacity` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `totalseats` INT(11) NULL DEFAULT NULL ,
  `flightid` BIGINT(20) NULL DEFAULT NULL ,
  `classid` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `FK1653292AD8F7A7D6` (`flightid` ASC) ,
  INDEX `FK1653292A79413680` (`classid` ASC) ,
  CONSTRAINT `FK1653292A79413680`
    FOREIGN KEY (`classid` )
    REFERENCES `happytrip_itr1`.`classes` (`classid` ),
  CONSTRAINT `FK1653292AD8F7A7D6`
    FOREIGN KEY (`flightid` )
    REFERENCES `happytrip_itr1`.`flights` (`flightid` ))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`flightroutecosts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`flightroutecosts` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`flightroutecosts` (
  `flightroutecostid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `costperticket` FLOAT NULL DEFAULT NULL ,
  `classid` BIGINT(20) NULL DEFAULT NULL ,
  `flightrouteid` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`flightroutecostid`) ,
  INDEX `FK31C8560D79413680` (`classid` ASC) ,
  INDEX `FK31C8560D8A21F572` (`flightrouteid` ASC) ,
  CONSTRAINT `FK31C8560D8A21F572`
    FOREIGN KEY (`flightrouteid` )
    REFERENCES `happytrip_itr1`.`flightroutes` (`flightrouteid` ),
  CONSTRAINT `FK31C8560D79413680`
    FOREIGN KEY (`classid` )
    REFERENCES `happytrip_itr1`.`classes` (`classid` ))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`roomtypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`roomtypes` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`roomtypes` (
  `typeid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`typeid`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`hotelrooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`hotelrooms` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`hotelrooms` (
  `hotelid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `costperday` FLOAT NULL DEFAULT NULL ,
  `noofrooms` INT(11) NULL DEFAULT NULL ,
  `typeid` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`hotelid`) ,
  INDEX `FK3725C9C4501B37A5` (`typeid` ASC) ,
  CONSTRAINT `FK3725C9C4501B37A5`
    FOREIGN KEY (`typeid` )
    REFERENCES `happytrip_itr1`.`roomtypes` (`typeid` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`hotelbookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`hotelbookings` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`hotelbookings` (
  `bookingid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `costperday` FLOAT NULL DEFAULT NULL ,
  `fromdate` DATETIME NULL DEFAULT NULL ,
  `noofpeople` INT(11) NULL DEFAULT NULL ,
  `noofrooms` INT(11) NULL DEFAULT NULL ,
  `todate` DATETIME NULL DEFAULT NULL ,
  `roomid` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`bookingid`) ,
  INDEX `FK1840D0EEE06A002A` (`roomid` ASC) ,
  CONSTRAINT `FK1840D0EEE06A002A`
    FOREIGN KEY (`roomid` )
    REFERENCES `happytrip_itr1`.`hotelrooms` (`hotelid` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`hotelcontacts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`hotelcontacts` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`hotelcontacts` (
  `hotelid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `address` VARCHAR(255) NULL DEFAULT NULL ,
  `contactno` VARCHAR(255) NULL DEFAULT NULL ,
  `email` VARCHAR(255) NULL DEFAULT NULL ,
  `pinCode` VARCHAR(255) NULL DEFAULT NULL ,
  `cityid` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`hotelid`) ,
  INDEX `FK7EE82E07824839CC` (`cityid` ASC) ,
  CONSTRAINT `FK7EE82E07824839CC`
    FOREIGN KEY (`cityid` )
    REFERENCES `happytrip_itr1`.`cities` (`cityid` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`hotelratings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`hotelratings` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`hotelratings` (
  `hotelid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `rating` FLOAT NULL DEFAULT NULL ,
  `totalratings` DECIMAL(19,2) NULL DEFAULT NULL ,
  PRIMARY KEY (`hotelid`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`hotels`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`hotels` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`hotels` (
  `hotelid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `briefnote` VARCHAR(255) NULL DEFAULT NULL ,
  `hotelname` VARCHAR(255) NULL DEFAULT NULL ,
  `photourl` VARCHAR(255) NULL DEFAULT NULL ,
  `starranking` INT(11) NULL DEFAULT NULL ,
  `cityid` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`hotelid`) ,
  INDEX `FKB7CA753F824839CC` (`cityid` ASC) ,
  CONSTRAINT `FKB7CA753F824839CC`
    FOREIGN KEY (`cityid` )
    REFERENCES `happytrip_itr1`.`cities` (`cityid` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`hotelrooms_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`hotelrooms_types` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`hotelrooms_types` (
  `hotelid` BIGINT(20) NOT NULL ,
  `typeid` BIGINT(20) NOT NULL ,
  PRIMARY KEY (`hotelid`, `typeid`) ,
  INDEX `FK74E8223ED9BB5E48` (`hotelid` ASC) ,
  INDEX `FK74E8223E501B37A5` (`typeid` ASC) ,
  CONSTRAINT `FK74E8223E501B37A5`
    FOREIGN KEY (`typeid` )
    REFERENCES `happytrip_itr1`.`roomtypes` (`typeid` ),
  CONSTRAINT `FK74E8223ED9BB5E48`
    FOREIGN KEY (`hotelid` )
    REFERENCES `happytrip_itr1`.`hotels` (`hotelid` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`passengers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`passengers` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`passengers` (
  `passengerid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `dateofbirth` VARCHAR(255) NULL DEFAULT NULL ,
  `gender` VARCHAR(255) NULL DEFAULT NULL ,
  `name` VARCHAR(255) NULL DEFAULT NULL ,
  `title` VARCHAR(255) NULL DEFAULT NULL ,
  `bookingid` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`passengerid`) ,
  INDEX `FK2E3B3F19788C76C2` (`bookingid` ASC) ,
  CONSTRAINT `FK2E3B3F19788C76C2`
    FOREIGN KEY (`bookingid` )
    REFERENCES `happytrip_itr1`.`flightbookings` (`bookingid` ))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`reviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`reviews` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`reviews` (
  `reviewid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `createddate` DATETIME NULL DEFAULT NULL ,
  `isactive` TINYINT(4) NULL DEFAULT NULL ,
  `isreportabused` TINYINT(4) NULL DEFAULT NULL ,
  `reviewtext` VARCHAR(255) NULL DEFAULT NULL ,
  `hotelid` BIGINT(20) NULL DEFAULT NULL ,
  `userid` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`reviewid`) ,
  INDEX `FK418FF41BD9BB5E48` (`hotelid` ASC) ,
  INDEX `FK418FF41BA18DC68C` (`userid` ASC) ,
  CONSTRAINT `FK418FF41BA18DC68C`
    FOREIGN KEY (`userid` )
    REFERENCES `happytrip_itr1`.`users` (`user_id` ),
  CONSTRAINT `FK418FF41BD9BB5E48`
    FOREIGN KEY (`hotelid` )
    REFERENCES `happytrip_itr1`.`hotels` (`hotelid` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`routereport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`routereport` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`routereport` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `fromcity` VARCHAR(255) NULL DEFAULT NULL ,
  `tocity` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`scheduledflightreport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`scheduledflightreport` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`scheduledflightreport` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `arrivaltime` VARCHAR(255) NULL DEFAULT NULL ,
  `departuretime` VARCHAR(255) NULL DEFAULT NULL ,
  `flightnumber` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`seatavailability`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`seatavailability` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`seatavailability` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `availableseats` INT(11) NULL DEFAULT NULL ,
  `classid` BIGINT(20) NULL DEFAULT NULL ,
  `scheduledflightid` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `FKE79003E079413680` (`classid` ASC) ,
  INDEX `FKE79003E0C39FAD3A` (`scheduledflightid` ASC) ,
  CONSTRAINT `FKE79003E0C39FAD3A`
    FOREIGN KEY (`scheduledflightid` )
    REFERENCES `happytrip_itr1`.`scheduledflight` (`flightrouteid` ),
  CONSTRAINT `FKE79003E079413680`
    FOREIGN KEY (`classid` )
    REFERENCES `happytrip_itr1`.`classes` (`classid` ))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`user_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`user_roles` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`user_roles` (
  `user_role_id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `authority` VARCHAR(255) NULL DEFAULT NULL ,
  `user_id` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`user_role_id`) ,
  INDEX `FK73429949CA9D8275` (`user_id` ASC) ,
  CONSTRAINT `FK73429949CA9D8275`
    FOREIGN KEY (`user_id` )
    REFERENCES `happytrip_itr1`.`users` (`user_id` ))
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`usercontactinformation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`usercontactinformation` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`usercontactinformation` (
  `contactid` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `address` VARCHAR(255) NULL DEFAULT NULL ,
  `mobileno` VARCHAR(255) NULL DEFAULT NULL ,
  `pincode` VARCHAR(255) NULL DEFAULT NULL ,
  `cityid` BIGINT(20) NULL DEFAULT NULL ,
  `user_id` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`contactid`) ,
  INDEX `FK82432C17CA9D8275` (`user_id` ASC) ,
  INDEX `FK82432C17824839CC` (`cityid` ASC) ,
  CONSTRAINT `FK82432C17CA9D8275`
    FOREIGN KEY (`user_id` )
    REFERENCES `happytrip_itr1`.`users` (`user_id` ))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `happytrip_itr1`.`userreport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happytrip_itr1`.`userreport` ;

CREATE  TABLE IF NOT EXISTS `happytrip_itr1`.`userreport` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(255) NULL DEFAULT NULL ,
  `fullname` VARCHAR(255) NULL DEFAULT NULL ,
  `gender` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
