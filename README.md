InfluenzaNet European Database
===============================

This repo will contain script and base data used to create local version of european-level InfluenzaNet DB

Requirements:

- Python >= 2.6 & < 3
- bash
- PostgreSQL 9.1

To create initial data files:
- R >= 3.2 (+ reshape2 & dplyr)

How it works
-------------

- Run all scripts in bin/ from the top directory (all path are relative to this top dir).
- local/ dir will contain local specific scripts and local data (dumps to import) and is not under revision
  For example bin/post-import command, will look for a "local/post-import" script to hold post-import processing only
  needed for the local db. 