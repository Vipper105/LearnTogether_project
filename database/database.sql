-- ÃƒÂ­Ã¢â‚¬Â¦Ã…â€™ÃƒÂ¬Ã¯Â¿Â½Ã‚Â´ÃƒÂ«Ã‚Â¸Ã¢â‚¬ï¿½ ÃƒÂ¬Ã‹â€ Ã…â€œÃƒÂ¬Ã¢â‚¬Å¾Ã…â€œÃƒÂ«Ã…Â Ã¢â‚¬ï¿½ ÃƒÂªÃ‚Â´Ã¢â€šÂ¬ÃƒÂªÃ‚Â³Ã¢â‚¬Å¾ÃƒÂ«Ã‚Â¥Ã‚Â¼ ÃƒÂªÃ‚Â³Ã‚Â ÃƒÂ«Ã‚Â Ã‚Â¤ÃƒÂ­Ã¢â‚¬Â¢Ã‹Å“ÃƒÂ¬Ã¢â‚¬â€�Ã‚Â¬ ÃƒÂ­Ã¢â‚¬Â¢Ã…â€œ ÃƒÂ«Ã‚Â²Ã‹â€ ÃƒÂ¬Ã¢â‚¬â€�Ã¯Â¿Â½ ÃƒÂ¬Ã¢â‚¬Â¹Ã‚Â¤ÃƒÂ­Ã¢â‚¬â€œÃ¢â‚¬Â°ÃƒÂ­Ã¢â‚¬Â¢Ã‚Â´ÃƒÂ«Ã¯Â¿Â½Ã¢â‚¬Å¾ ÃƒÂ¬Ã¢â‚¬â€�Ã¯Â¿Â½ÃƒÂ«Ã…Â¸Ã‚Â¬ÃƒÂªÃ‚Â°Ã¢â€šÂ¬ ÃƒÂ«Ã‚Â°Ã…â€œÃƒÂ¬Ã†â€™Ã¯Â¿Â½ÃƒÂ­Ã¢â‚¬Â¢Ã‹Å“ÃƒÂ¬Ã‚Â§Ã¢â€šÂ¬ ÃƒÂ¬Ã¢â‚¬Â¢Ã…Â ÃƒÂªÃ‚Â²Ã…â€™ ÃƒÂ¬Ã‚Â Ã¢â‚¬Â¢ÃƒÂ«Ã‚Â Ã‚Â¬ÃƒÂ«Ã¯Â¿Â½Ã‹Å“ÃƒÂ¬Ã¢â‚¬â€�Ã‹â€ ÃƒÂ¬Ã…Â Ã‚ÂµÃƒÂ«Ã¢â‚¬Â¹Ã‹â€ ÃƒÂ«Ã¢â‚¬Â¹Ã‚Â¤.

-- role Table Create SQL
CREATE TABLE role
(
    `id`        INT            NOT NULL    AUTO_INCREMENT, 
    `roleName`  VARCHAR(45)    NOT NULL, 
    PRIMARY KEY (id)
);


-- role Table Create SQL
CREATE TABLE user
(
    `id`         INT             NOT NULL    AUTO_INCREMENT, 
    `email`      VARCHAR(255)    NOT NULL, 
    `userName`   VARCHAR(255)    NOT NULL, 
    `password`   VARCHAR(255)    NOT NULL, 
    `fullName`   VARCHAR(255)    NULL, 
    `address`    VARCHAR(255)    NULL, 
    `amount`     DOUBLE          NULL, 
    `birthDate`  DATE            NULL, 
    `roleId`     INT             NOT NULL, 
    `urlImg`     VARCHAR(255)    NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE user
    ADD CONSTRAINT FK_user_roleId_role_id FOREIGN KEY (roleId)
        REFERENCES role (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE instructor
(
    `id`              INT             NOT NULL    AUTO_INCREMENT, 
    `userId`          INT             NOT NULL, 
    `experienceYear`  INT             NULL, 
    `numStudent`      INT             NULL, 
    `rateValue`       INT             NULL, 
    `skillLevel`      VARCHAR(45)     NULL, 
    `about_me`        VARCHAR(255)    NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE instructor
    ADD CONSTRAINT FK_instructor_userId_user_id FOREIGN KEY (userId)
        REFERENCES user (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE category
(
    `id`            INT            NOT NULL    AUTO_INCREMENT, 
    `categoryName`  VARCHAR(45)    NOT NULL, 
    PRIMARY KEY (id)
);


-- role Table Create SQL
CREATE TABLE course_level
(
    `id`         INT(1)         NOT NULL    AUTO_INCREMENT, 
    `levelName`  VARCHAR(45)    NOT NULL, 
    PRIMARY KEY (id)
);


-- role Table Create SQL
CREATE TABLE course
(
    `id`             INT            NOT NULL    AUTO_INCREMENT, 
    `courseTitle`    VARCHAR(60)    NOT NULL, 
    `description`    TEXT           NULL, 
    `priceCourse`    DOUBLE         NOT NULL, 
    `language`       VARCHAR(45)    NOT NULL, 
    `courseLevelId`  INT            NULL, 
    `numStudent`     INT            NULL, 
    `createDate`     DATE           NOT NULL, 
    `lastedUpdate`   DATE           NOT NULL, 
    `instructorId`   INT            NOT NULL, 
    `categoryId`     INT            NOT NULL, 
    `urlImg`         VARCHAR(45)    NULL, 
    `status`         BIT            NOT NULL    COMMENT '0: draft, 1: approved',
    `submit`         BIT            NOT NULL    COMMENT '0: not yet, 1: submitted', 
    PRIMARY KEY (id)
);

ALTER TABLE course
    ADD CONSTRAINT FK_course_instructorId_instructor_id FOREIGN KEY (instructorId)
        REFERENCES instructor (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE course
    ADD CONSTRAINT FK_course_categoryId_category_id FOREIGN KEY (categoryId)
        REFERENCES category (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE course
    ADD CONSTRAINT FK_course_courseLevelId_course_level_id FOREIGN KEY (courseLevelId)
        REFERENCES course_level (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE section
(
    `id`           INT             NOT NULL    AUTO_INCREMENT, 
    `title`        VARCHAR(45)     NOT NULL, 
    `description`  VARCHAR(255)    NULL, 
    `courseId`     INT             NOT NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE section
    ADD CONSTRAINT FK_section_courseId_course_id FOREIGN KEY (courseId)
        REFERENCES course (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE test_type
(
    `id`    INT            NOT NULL    AUTO_INCREMENT, 
    `type`  VARCHAR(45)    NOT NULL, 
    PRIMARY KEY (id)
);


-- role Table Create SQL
CREATE TABLE test
(
    `id`           INT             NOT NULL    AUTO_INCREMENT, 
    `title`        VARCHAR(255)    NOT NULL, 
    `numQuestion`  INT             NOT NULL, 
    `score`        DOUBLE          NOT NULL, 
    `sectionId`    INT             NOT NULL, 
    `updateDate`   DATE            NOT NULL, 
    `typeId`       INT             NOT NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE test
    ADD CONSTRAINT FK_test_sectionId_section_id FOREIGN KEY (sectionId)
        REFERENCES section (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE test
    ADD CONSTRAINT FK_test_typeId_test_type_id FOREIGN KEY (typeId)
        REFERENCES test_type (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE orders
(
    `id`           INT       NOT NULL    AUTO_INCREMENT, 
    `user_id`      INT       NOT NULL, 
    `createDate`   DATE      NOT NULL, 
    `totalAmount`  DOUBLE    NOT NULL, 
    `status`       INT       NOT NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE orders
    ADD CONSTRAINT FK_orders_user_id_user_id FOREIGN KEY (user_id)
        REFERENCES user (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE multichoice_question
(
    `id`      INT             NOT NULL    AUTO_INCREMENT, 
    `title`   VARCHAR(255)    NOT NULL, 
    `testId`  INT             NOT NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE multichoice_question
    ADD CONSTRAINT FK_multichoice_question_testId_test_id FOREIGN KEY (testId)
        REFERENCES test (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE essay_question
(
    `id`      INT             NOT NULL    AUTO_INCREMENT, 
    `title`   VARCHAR(255)    NOT NULL, 
    `testId`  INT             NOT NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE essay_question
    ADD CONSTRAINT FK_essay_question_testId_test_id FOREIGN KEY (testId)
        REFERENCES test (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE certificate
(
    `id`               INT             NOT NULL    AUTO_INCREMENT, 
    `certificateName`  VARCHAR(45)     NOT NULL, 
    `provider`         VARCHAR(255)    NOT NULL, 
    `courseID`         INT             NOT NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE certificate
    ADD CONSTRAINT FK_certificate_courseID_course_id FOREIGN KEY (courseID)
        REFERENCES course (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE promotion
(
    `id`             INT            NOT NULL    AUTO_INCREMENT, 
    `promotionName`  VARCHAR(45)    NOT NULL, 
    `endDate`        DATE           NOT NULL, 
    `discount`       int            NOT NULL, 
    `startDate`      DATE           NOT NULL, 
    PRIMARY KEY (id)
);


-- role Table Create SQL
CREATE TABLE status
(
    `id`          INT             NOT NULL    AUTO_INCREMENT, 
    `statusName`  VARCHAR(255)    NOT NULL, 
    PRIMARY KEY (id)
);


-- role Table Create SQL
CREATE TABLE course_order
(
    `id`        INT    NULL        AUTO_INCREMENT, 
    `courseId`  INT    NOT NULL, 
    `orderId`   INT    NOT NULL, 
    `quantity`  int    NOT NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE course_order
    ADD CONSTRAINT FK_course_order_courseId_course_id FOREIGN KEY (courseId)
        REFERENCES course (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE course_order
    ADD CONSTRAINT FK_course_order_orderId_orders_id FOREIGN KEY (orderId)
        REFERENCES orders (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE invoice
(
    `id`          INT     NOT NULL    AUTO_INCREMENT, 
    `createDate`  DATE    NOT NULL, 
    `orderId`     INT     NOT NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE invoice
    ADD CONSTRAINT FK_invoice_orderId_orders_id FOREIGN KEY (orderId)
        REFERENCES orders (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE rating
(
    `id`         INT    NOT NULL    AUTO_INCREMENT, 
    `rateValue`  INT    NOT NULL, 
    `courseId`   INT    NOT NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE rating
    ADD CONSTRAINT FK_rating_courseId_course_id FOREIGN KEY (courseId)
        REFERENCES course (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE answer_multichoiceQ
(
    `id`             INT             NOT NULL    AUTO_INCREMENT, 
    `multichoiceId`  INT             NOT NULL, 
    `answerContent`  VARCHAR(255)    NOT NULL, 
    `isCorrect`      BIT             NOT NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE answer_multichoiceQ
    ADD CONSTRAINT FK_answer_multichoiceQ_multichoiceId_multichoice_question_id FOREIGN KEY (multichoiceId)
        REFERENCES multichoice_question (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE certificates_user
(
    `id`             INT     NOT NULL    AUTO_INCREMENT, 
    `certificateId`  INT     NOT NULL, 
    `userId`         INT     NOT NULL, 
    `date`           DATE    NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE certificates_user
    ADD CONSTRAINT FK_certificates_user_certificateId_certificate_id FOREIGN KEY (certificateId)
        REFERENCES certificate (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE certificates_user
    ADD CONSTRAINT FK_certificates_user_userId_user_id FOREIGN KEY (userId)
        REFERENCES user (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE promotion_course
(
    `id`             INT       NOT NULL    AUTO_INCREMENT, 
    `promotionId`    INT       NOT NULL, 
    `courseId`       INT       NOT NULL, 
    `updateDate`     DATE      NOT NULL, 
    `priceDiscount`  DOUBLE    NOT NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE promotion_course
    ADD CONSTRAINT FK_promotion_course_promotionId_promotion_id FOREIGN KEY (promotionId)
        REFERENCES promotion (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE promotion_course
    ADD CONSTRAINT FK_promotion_course_courseId_course_id FOREIGN KEY (courseId)
        REFERENCES course (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE resultEssayQ
(
    `id`               INT             NOT NULL    AUTO_INCREMENT, 
    `score`            DOUBLE          NOT NULL, 
    `userAnser`        VARCHAR(255)    NOT NULL, 
    `essayQuestionId`  INT             NOT NULL, 
    `userId`           INT             NOT NULL, 
    `testId`           INT             NOT NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE resultEssayQ
    ADD CONSTRAINT FK_resultEssayQ_essayQuestionId_essay_question_id FOREIGN KEY (essayQuestionId)
        REFERENCES essay_question (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE resultEssayQ
    ADD CONSTRAINT FK_resultEssayQ_userId_user_id FOREIGN KEY (userId)
        REFERENCES user (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE resultEssayQ
    ADD CONSTRAINT FK_resultEssayQ_testId_test_id FOREIGN KEY (testId)
        REFERENCES test (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE lesson
(
    `id`         INT             NOT NULL    AUTO_INCREMENT, 
    `title`      VARCHAR(45)     NOT NULL,
    `description`  TEXT          NULL, 
    `urlVid`     VARCHAR(45)     NULL, 
    `sectionId`  INT             NOT NULL, 
    `urlImg`     VARCHAR(255)    NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE lesson
    ADD CONSTRAINT FK_lesson_sectionId_section_id FOREIGN KEY (sectionId)
        REFERENCES section (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE resultMultiQ
(
    `id`                     INT       NOT NULL    AUTO_INCREMENT, 
    `score`                  DOUBLE    NOT NULL, 
    `userAnswer`             BIT       NOT NULL, 
    `multichoiceQuestionId`  INT       NOT NULL, 
    `userId`                 INT       NOT NULL, 
    `testId`                 INT       NOT NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE resultMultiQ
    ADD CONSTRAINT FK_resultMultiQ_multichoiceQuestionId_multichoice_question_id FOREIGN KEY (multichoiceQuestionId)
        REFERENCES multichoice_question (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE resultMultiQ
    ADD CONSTRAINT FK_resultMultiQ_userId_user_id FOREIGN KEY (userId)
        REFERENCES user (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE resultMultiQ
    ADD CONSTRAINT FK_resultMultiQ_testId_test_id FOREIGN KEY (testId)
        REFERENCES test (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE answer_essayQ
(
    `id`             INT             NOT NULL    AUTO_INCREMENT, 
    `answerContent`  VARCHAR(255)    NOT NULL, 
    `essayId`        INT             NOT NULL, 
    `isCorrect`      BIT             NOT NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE answer_essayQ
    ADD CONSTRAINT FK_answer_essayQ_essayId_essay_question_id FOREIGN KEY (essayId)
        REFERENCES essay_question (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE test_result
(
    `id`            INT       NOT NULL    AUTO_INCREMENT, 
    `userId`        INT       NOT NULL, 
    `instructorId`  INT       NOT NULL, 
    `score`         DOUBLE    NOT NULL, 
    `testId`        INT       NOT NULL, 
    `dateTest`      DATE      NOT NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE test_result
    ADD CONSTRAINT FK_test_result_userId_user_id FOREIGN KEY (userId)
        REFERENCES user (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE test_result
    ADD CONSTRAINT FK_test_result_instructorId_course_id FOREIGN KEY (instructorId)
        REFERENCES course (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE test_result
    ADD CONSTRAINT FK_test_result_testId_test_id FOREIGN KEY (testId)
        REFERENCES test (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- role Table Create SQL
CREATE TABLE status_user
(
    `id`         INT    NOT NULL    AUTO_INCREMENT, 
    `userId`     INT    NOT NULL, 
    `status_id`  INT    NOT NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE status_user
    ADD CONSTRAINT FK_status_user_userId_user_id FOREIGN KEY (userId)
        REFERENCES user (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE status_user
    ADD CONSTRAINT FK_status_user_status_id_status_id FOREIGN KEY (status_id)
        REFERENCES status (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


/* ================Insert================*/
INSERT INTO category (categoryName)
VALUES 
('Finance & Accounting'),
('Development'),
('Business'),
('IT & Software'),
('Office Productivity'),
('Personal Development'),
('Design'),
('Marketing'),
('Lifestyle'),
('Photography'),
('Health & Fitness'),
('Music'),
('Teaching & Academics'),
('I don\'t know yet');

INSERT INTO course_level (levelName)
VALUES 
('Beginner Level'),
('Intermediate Level'),
('Expert Level'),
('All Levels');

INSERT INTO role (roleName)
VALUES
('admin'),
('user');