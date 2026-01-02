CREATE TABLE `schema_migrations`(`filename` varchar(255) NOT NULL PRIMARY KEY);
CREATE TABLE `grammars`(
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `name` string NOT NULL,
  `description` text,
  `repository_url` string NOT NULL,
  `created_at` timestamp DEFAULT(datetime(CURRENT_TIMESTAMP, 'localtime')) NOT NULL,
  `updated_at` timestamp DEFAULT(datetime(CURRENT_TIMESTAMP, 'localtime')) NOT NULL
);
CREATE UNIQUE INDEX `grammars_name_index` ON `grammars`(`name`);
CREATE TABLE `versions`(
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `grammar_id` integer NOT NULL REFERENCES `grammars` ON DELETE CASCADE,
  `identifier` string NOT NULL,
  `created_at` timestamp DEFAULT(datetime(CURRENT_TIMESTAMP, 'localtime')) NOT NULL,
  `updated_at` timestamp DEFAULT(datetime(CURRENT_TIMESTAMP, 'localtime')) NOT NULL
);
CREATE INDEX `versions_identifier_index` ON `versions`(`identifier`);
CREATE UNIQUE INDEX `versions_grammar_id_identifier_index` ON `versions`(
  `grammar_id`,
  `identifier`
);
INSERT INTO schema_migrations (filename) VALUES
('20251222200437_create_grammars.rb'),
('20251231115033_create_versions.rb');
