-- INTEGRATION WITH AWS ACCOUNT
-- TWO TYPE CREATE STAGE AND CREATE STORAGE INTEGRATION
-- GOOD PRACTICE TO USE CREATE STORAGE INTEGRATION


CREATE STAGE netflixstage
URL = ''
CREDENTIALS = (AWS_KEY_ID = '' AWS_SECRET_KEY = '')


-- Create Schema for raw_movies and load the data
CREATE OR REPLACE TABLE raw_movies(
    movieId INTEGER,
    title STRING,
    genres STRING
)

COPY INTO raw_movies
FROM '@NETFLIXSTAGE/movies.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

SELECT * FROM raw_movies LIMIT 10;

-- Create Schema for genome_scores table and load the data 
CREATE OR REPLACE TABLE raw_genome_scores(
    movieId INTEGER,
    tagId INTEGER,
    relevance FLOAT  
)

COPY INTO raw_genome_scores
FROM '@NETFLIXSTAGE/genome-scores.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER =1
FIELD_OPTIONALLY_ENCLOSED_BY = '"');

SELECT * FROM raw_genome_scores LIMIT 10;

-- Create Schema for genome_tags table and load the data 
CREATE OR REPLACE TABLE raw_genome_tags(
    tagId INTEGER,
    tag STRING
)

COPY INTO raw_genome_tags
FROM '@NETFLIXSTAGE/genome-tags.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1
FIELD_OPTIONALLY_ENCLOSED_BY = '"');

SELECT * FROM raw_genome_tags LIMIT 10;

-- Create Schema for raw_links table and load the data 
CREATE OR REPLACE TABLE raw_links (
    movieId INTEGER,
    imdbId INTEGER,
    tmdbId INTEGER
);

COPY INTO raw_links
FROM '@NETFLIXSTAGE/links.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

SELECT * FROM raw_links LIMIT 10;

-- Create Schema for raw_ratings table and load the data 
CREATE OR REPLACE TABLE raw_ratings (
    userId INTEGER,
    movieId INTEGER,
    rating FLOAT,
    timestamp TIMESTAMP    
);

COPY INTO raw_ratings
FROM '@NETFLIXSTAGE/ratings.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

SELECT * FROM raw_ratings LIMIT 10;

-- Create Schema for raw_tags table and load the data 
CREATE OR REPLACE TABLE raw_tags (
    userId INTEGER,
    movieId INTEGER,
    tag STRING,
    timestamp TIMESTAMP    
);

COPY INTO RAW_TAGS 
FROM '@netflixstage/tags.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"')
ON_ERROR = 'CONTINUE';

SELECT * FROM raw_tags LIMIT 10;
