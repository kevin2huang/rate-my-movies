﻿SET search_path = "Test";
-- 
-- DROP TABLE ACTOR;
-- DROP TABLE DIRECTOR;
-- DROP TABLE GENRE;
-- DROP TABLE PROFILE;
-- DROP TABLE RAKEUSER;
-- DROP TABLE REVIEW CASCADE;
-- DROP TABLE STUDIO;
-- DROP TABLE MOVIES CASCADE; 
-- DROP TABLE MOVREV;
-- DROP TABLE WISH

-- CREATE TABLE MOVIES
-- (MOVIE_ID SERIAL PRIMARY KEY,
-- MOVIE_TITLE VARCHAR(20),
-- MOVIE_COVER TEXT,
-- MOVIE_RELEASE_DATE VARCHAR(20),
-- MOVIE_DESCRIPTION VARCHAR(300), 
-- MOVIE_DURATION INTEGER,
-- MOVIE_LANGUAGE VARCHAR(20),
-- MOVIE_COUNTRY TEXT,
-- MOVIE_TG_RATING VARCHAR(7));
-- 
-- CREATE TABLE RAKEUSER
-- (USER_ID SERIAL PRIMARY KEY,
-- USER_NAME VARCHAR(35) NOT NULL,
-- USER_EMAIL TEXT NOT NULL,
-- USER_PASSWORD TEXT NOT NULL, 
-- USER_GENDER CHAR(1),
-- USER_DOB DATE,
-- USER_ICON TEXT,
-- UNIQUE(USER_EMAIL));
-- 
-- CREATE TABLE GENRE
-- (GENRE_ID SERIAL PRIMARY KEY,
-- GENRE_NAME VARCHAR(20));
-- 
-- CREATE TABLE DIRECTOR
-- (DIR_ID SERIAL PRIMARY KEY,
-- DIR_NAME TEXT);
-- 
-- CREATE TABLE ACTOR
-- (ACTOR_ID SERIAL PRIMARY KEY,
-- ACTOR_NAME TEXT);
-- 
-- CREATE TABLE STUDIO
-- (STUDIO_ID SERIAL PRIMARY KEY,
-- STUDIO_NAME TEXT,
-- STUDIO_COUNTRY TEXT);
-- 
-- CREATE TABLE PROFILE 
-- (PROFILE_ID SERIAL PRIMARY KEY,
-- USER_ID INTEGER,
-- FOREIGN KEY (USER_ID) REFERENCES RAKEUSER(USER_ID),
-- PROFILE_PROVINCE TEXT,
-- PROFILE_CITY TEXT,
-- PROFILE_OCCUPATION VARCHAR(30),
-- PROFILE_COUNTRY TEXT,
-- PROFILE_QUOTE VARCHAR(100),
-- UNIQUE(USER_ID));
-- 
-- CREATE TABLE REVIEW
-- (REVIEW_ID SERIAL PRIMARY KEY,
-- REVIEW_DESCRIPTION VARCHAR(500),
-- REVIEW_RATING INTEGER DEFAULT 0,
-- REVIEW_DATE DATE,
-- CONSTRAINT REVIEW_RATING_C CHECK (REVIEW_RATING >= 0 AND REVIEW_RATING <= 5 ));

-- CREATE TABLE MOVREV
-- (MOVIE_ID INTEGER,
-- FOREIGN KEY (MOVIE_ID) REFERENCES MOVIES(MOVIE_ID),
-- REVIEW_ID INTEGER,
-- FOREIGN KEY (REVIEW_ID) REFERENCES REVIEW(REVIEW_ID));

-- CREATE TABLE WISH 
-- (USER_ID INTEGER,
-- FOREIGN KEY (USER_ID) REFERENCES RAKEUSER(USER_ID),
-- MOVIE_ID INTEGER,
-- FOREIGN KEY (MOVIE_ID) REFERENCES MOVIES(MOVIE_ID),
-- WISH_TIMESTAMP DATE);

-- CREATE TABLE USRREV
-- (USER_ID INTEGER,
-- FOREIGN KEY (USER_ID) REFERENCES RAKEUSER(USER_ID),
-- REVIEW_ID INTEGER,
-- FOREIGN KEY (REVIEW_ID) REFERENCES REVIEW(REVIEW_ID));

-- CREATE TABLE USRACT
-- (USER_ID INTEGER,
-- FOREIGN KEY (USER_ID) REFERENCES RAKEUSER(USER_ID),
-- ACTOR_ID INTEGER,
-- FOREIGN KEY (ACTOR_ID) REFERENCES ACTOR(ACTOR_ID));

-- CREATE TABLE MOVGEN
-- (MOVIE_ID INTEGER,
-- FOREIGN KEY (MOVIE_ID) REFERENCES MOVIES(MOVIE_ID),
-- GENRE_ID INTEGER,
-- FOREIGN KEY (GENRE_ID) REFERENCES GENRE(GENRE_ID));
	
-- CREATE TABLE MOVACT
-- (MOVIE_ID INTEGER,
-- FOREIGN KEY (MOVIE_ID) REFERENCES MOVIES(MOVIE_ID),
-- ACTOR_ID INTEGER,
-- FOREIGN KEY (ACTOR_ID) REFERENCES ACTOR(ACTOR_ID),
-- ROLE VARCHAR(20));
	
-- CREATE TABLE SPONSOR
-- (MOVIE_ID INTEGER,
-- FOREIGN KEY (MOVIE_ID) REFERENCES MOVIES(MOVIE_ID),
-- STUDIO_ID INTEGER,
-- FOREIGN KEY (STUDIO_ID) REFERENCES STUDIO(STUDIO_ID));

-- CREATE TABLE MOVDIR
-- (MOVIE_ID INTEGER,
-- FOREIGN KEY (MOVIE_ID) REFERENCES MOVIES(MOVIE_ID),
-- DIRECTOR_ID INTEGER,
-- FOREIGN KEY (DIRECTOR_ID) REFERENCES DIRECTOR(DIRECTOR_ID));


	
--------------INITIAL TABLE INSERTS--------------------------------------------------------------------------------------------------------

-- ***************REVIEW*********************************************************************************************
-- INSERT INTO REVIEW (REVIEW_DESCRIPTION, REVIEW_RATING, REVIEW_DATE)
-- VALUES
-- ('blablabla', 5, 'March 23 2016')
-- ******************************************************************************************************************

-- ***************USER***********************************************************************************************
-- INSERT INTO RAKEUSER (USER_NAME, USER_EMAIL, USER_PASSWORD, USER_GENDER, USER_DOB, USER_ICON)
-- VALUES
-- ('Abigael', 'abigael.tremblay@gmail.com', '1234', '', '22 April 1990', 'folder/folder/filename')
-- ******************************************************************************************************************

-- *****************PROFILE******************************************************************************************
-- INSERT INTO PROFILE (USER_ID, PROFILE_PROVINCE, PROFILE_CITY, PROFILE_OCCUPATION, PROFILE_COUNTRY, PROFILE_QUOTE)
-- VALUES
-- (1, 'Ontario', 'Ottawa', 'Student', 'Canada', 'Today is such a nice day!')
-- ******************************************************************************************************************

-- ***************STUDIO*********************************************************************************************
-- INSERT INTO STUDIO (STUDIO_NAME)
-- VALUES
-- ('Pixar')
-- ******************************************************************************************************************

-- ***************ACTOR**********************************************************************************************
-- INSERT INTO ACTOR (ACTOR_NAME)
-- VALUES
-- ('Brad Pitt')
-- ******************************************************************************************************************

-- ***************DIRECTOR*******************************************************************************************
-- INSERT INTO DIRECTOR (DIR_NAME)
-- VALUES
-- ('Frank Darabont')
-- ******************************************************************************************************************

-- ***************GENRE**********************************************************************************************
-- INSERT INTO GENRE (GENRE_NAME)
-- VALUES
-- ('Action');
-- ******************************************************************************************************************

-- **************MOVIE **********************************************************************************************************************************
-- INSERT INTO MOVIES (MOVIE_TITLE, MOVIE_COVER, MOVIE_RELEASE_DATE, MOVIE_DESCRIPTION, MOVIE_TG_RATING, MOVIE_DURATION, MOVIE_LANGUAGE, MOVIE_COUNTRY)
-- VALUES 
-- ('Cloud Atlas','www.imdb.com/.../...' ,'October 26, 2012', 'Adam Ewing, an American lawyer, has come to the Chatham Islands to conclude a business arrangement with Reverend Horrox and his father-in-law.',
-- 'Rated R', 120, 'English', 'USA');
-- ******************************************************************************************************************************************************

-- ***************MOVREV*********************************************************************************************
-- INSERT INTO MOVREV (MOVIE_ID, REVIEW_ID)
-- VALUES
-- (1, 1)
-- ******************************************************************************************************************

-------------END INITIAL TABLE INSERTS--------------------------------------------------------------------------------------------------


--------------------QUERIES-------------------------------------------------------------------------------------------------------------

-- *********************LOGIN************************************************************************
-- SELECT * 
-- FROM RAKEUSER U
-- WHERE U.EMAIL = '$email' AND 
	  -- U.PASSWORD = '$password';

-- SELECT * 
-- FROM RAKEUSER U 
-- WHERE U.USER_EMAIL = 'abigael.tremblay@gmail.com' AND 
--       U.USER_PASSWORD = '1234';

-- ***************************************************************************************************

-- *******************PROFILE*************************************************************************
-- SELECT * 
-- FROM PROFILE P, RAKEUSER U
-- WHERE U.USER_ID = '$user_id' AND 
	  -- U.USER_ID = P.USER_ID;

-- SELECT * 
-- FROM PROFILE P 
-- WHERE (SELECT U.USER_ID 
-- 	FROM RAKEUSER U 
--         WHERE U.USER_EMAIL = 'abigael.tremblay@gmail.com' AND 
--         U.USER_PASSWORD = '1234') = P.USER_ID;

-- ***************************************************************************************************

-- *******************SIGN UP*************************************************************************

-- INSERT INTO RAKEUSER (USER_NAME, USER_EMAIL, USER_PASSWORD, USER_GENDER, USER_AGE, USER_PICTURE)
-- VALUES 
-- ('$name', '$email', '$password', '$gender', '$age', '$picture')

-- INSERT INTO PROFILE (USER_ID, PROFILE_PROVINCE, PROFILE_CITY, PROFILE_OCCUPATION, PROFILE_COUNTRY)
-- VALUES 
-- ($id, '$province', '$country', '$occupation', '$country', '$quote')
-- ***************************************************************************************************

-- ******************HOMEPAGE***************************************************************************

-- SELECT M.MOVIE_TITLE, M.MOVIE_RELEASE_DATE, M.MOVIE_DESCRIPTION, M.MOVIE_TG_RATING, M.MOVIE_DURATION 
-- FROM MOVIES M, REVIEWS R, MOVREV MR
-- WHERE MR.MOVIE_ID = M.MOVIE_ID AND 
	 -- 	MR.REVIEW_ID = R.REVIEW_ID AND 
			-- R. (SELECT MAX(AVG_RATING)
		-- 	FROM (SELECT MR.MOVIE_ID, AVG(R.RATING) AS AVG_RATING
				-- FROM MOVREV MR, REVIEW R
				-- GROUP BY MR.MOVIE_ID));

-- top rated movies
-- 4x random genres/actors + highest rating movie. total 4.

-- SELECT M.MOVIE_TITLE, M.MOVIE_RELEASE_DATE, M.MOVIE_DESCRIPTION, M.MOVIE_TG_RATING, M.MOVIE_DURATION
-- FROM MOVIES M, GENRE G, ACTOR A, DIRECTOR D,
-- -- WHERE 
-- ******************************************************************************************************

-- *****************ADD TO WISH LIST*********************************************************************

-- INSERT INTO WISH (USER_ID, MOVIE_ID, WISH_TIMESTAMP)
-- VALUES 
-- ('$user_id', '$movie_id', '$date')
-- ******************************************************************************************************

-- *****************OPEN PROFILE*************************************************************************

-- SELECT * 
-- FROM RAKEUSER U, PROFILE P
-- WHERE U.USER_ID = 1 AND 
	-- P.USER_ID = U.USER_ID;
-- ******************************************************************************************************

-- ********************SAVE PROFILE**********************************************************************

-- do this for each change
-- ALTER TABLE RAKEUSER 
	-- ALTER COLUMN USER_PASSWORD SET '$new_pass';
-- ******************************************************************************************************

-- *********************WISH LIST************************************************************************

-- SELECT M.MOVIE_TITLE, M.MOVIE_COVER, M.MOVIE_DURATION, WL.DATE
-- FROM MOVIES M, WISH WL, RAKEUSER U
-- WHERE U.USER_ID = '$id' AND 
		-- WL.USER_ID = U.USER_ID AND
		-- WL.MOVIE_ID = M.MOVIE_ID
-- ORDER BY WL.DATE DESC;
-- ********************************************************************************************************

-- ***********************DELETE MOVIE FROM WISH LIST******************************************************

-- DELETE FROM WISH 
	-- WHERE MOVIE_ID = '$movieid';
-- ********************************************************************************************************

-- ********************REVIEW LIST************************************************************************* 

-- SELECT R.REVIEW_DESCRIPTION, R.REVIEW_RATING, R.REVIEW_DATE 
-- FROM REVIEW R, RAKEUSER U
-- WHERE U.RAKEUSER = '$id';
-- ********************************************************************************************************

-- **********************WRITE A REVIEW********************************************************************

-- INSERT INTO TABLE REVIEW (REVIEW_DESCRIPTION, REVIEW_RATING, REVIEW_DATE)
-- VALUES ('$description','$rating','$date')

-- INSERT INTO USERREVIEW (USER_ID, REVIEW_ID)
-- VALUES ('$userid', '$reviewid')

-- INSERT INTO MOVREV (MOVIE_ID, REVIEW_ID)
-- VALUES ('$moveid', '$reviewid')
-- ********************************************************************************************************

-- ***********************GENRE LIST***********************************************************************

-- SELECT G.GENRE_NAME 
-- FROM GENRE G, USRGEN UG
-- WHERE UG.USER_ID = '$userid' AND 
		-- UG.GENRE_ID = G.GENRE_ID;
-- ********************************************************************************************************

-- ************************EDIT GENRE LIST*****************************************************************

-- INSERT INTO USRGEN (USER_ID, GENRE_ID)
-- VALUES ('$userid', '$genreid')

-- DELETE FROM USRGEN 
	-- WHERE USER_ID = '$userid' AND GENRE_ID = '$genreid';
-- ********************************************************************************************************
		
-------------------END OF QUERIES---------------------------------------------------------------------------------------------------------



