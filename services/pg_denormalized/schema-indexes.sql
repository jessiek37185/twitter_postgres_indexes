-- Performance tuning
SET maintenance_work_mem = '2GB';
SET max_parallel_maintenance_workers = 10;

-- Index creation
CREATE INDEX ON tweets_jsonb((data->>'lang'));
CREATE INDEX ON tweets_jsonb USING GIN (data jsonb_path_ops);
CREATE INDEX ON tweets_jsonb USING GIN (to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text')));
