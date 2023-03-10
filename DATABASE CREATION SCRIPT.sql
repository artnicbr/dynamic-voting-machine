DROP TABLE IF EXISTS voto;
DROP TABLE IF EXISTS votante;
DROP TABLE IF EXISTS eleicao;
DROP TABLE IF EXISTS admin;

CREATE TABLE eleicao(
	OID INT AUTO_INCREMENT,
	UID VARCHAR(64) NOT NULL,
	QUESTION VARCHAR(512) NOT NULL,
	DESCRIPTION VARCHAR(4000) DEFAULT NULL,
	CREATED_AT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	LAST_UPDATE TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	OPENNING_DATE TIMESTAMP NOT NULL,
	CLOSING_DATE TIMESTAMP NOT NULL,
	PRIMARY KEY(OID),
	CONSTRAINT CK_ID UNIQUE(UID)
);

CREATE TABLE votante(
	OID INT AUTO_INCREMENT,
	UID VARCHAR(32) NOT NULL,
	FULLNAME VARCHAR(512) NOT NULL,
	EMAIL VARCHAR(512) NULL,
	VOTE_WEIGHT INT DEFAULT 1,
	PRIMARY KEY(OID),
	CONSTRAINT CK_UID UNIQUE(UID)
);


CREATE TABLE voto(
	OID INT AUTO_INCREMENT,
	USER_ID INT NOT NULL,
	ELECTION_ID INT NOT NULL,
	VOTE_TIMESTAMP TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	VOTE_OPTION CHAR NOT NULL,
	PRIMARY KEY(OID),
	CONSTRAINT CK_VOTO CHECK (VOTE_OPTION IN ('F', 'C', 'A')),
	CONSTRAINT FK_ELEICAO FOREIGN KEY (ELECTION_ID) REFERENCES eleicao(OID),
	CONSTRAINT FK_VOTANTE FOREIGN KEY (USER_ID) REFERENCES votante(OID)
);

CREATE TABLE admin(
	OID INT AUTO_INCREMENT,
	UID VARCHAR(32) NOT NULL,
	LOGIN VARCHAR(64) NOT NULL,
	PASS VARCHAR(256) NOT NULL,
	PRIMARY KEY (OID),
	CONSTRAINT CK_LOGIN UNIQUE(LOGIN)
);

INSERT INTO admin (UID, LOGIN, PASS) VALUES ('1', 'andre',SHA2('cintra', 256));