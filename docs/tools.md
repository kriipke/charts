<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [- repo: https://github.com/commitizen-tools/commitizen](#--repo-httpsgithubcomcommitizen-toolscommitizen)
- [rev: master](#rev-master)
- [hooks:](#hooks)
- [- id: commitizen](#--id-commitizen)
- [- id: commitizen-branch](#--id-commitizen-branch)
- [stages: [push]](#stages-push)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

= TOOLS
:toc:

== gitleaks

	name: gitleaks
	on:
	  pull_request:
	  push:
	  workflow_dispatch:
	  schedule:
	    - cron: "0 4 * * *" # run once a day at 4 AM
	jobs:
	  scan:
	    name: gitleaks
	    runs-on: ubuntu-latest
	    steps:
	      - uses: actions/checkout@v4
		with:
		  fetch-depth: 0
	      - uses: gitleaks/gitleaks-action@v2
		env:
		  GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
		  GITLEAKS_LICENSE: ${{ secrets.GITLEAKS_LICENSE}} # Only required for Organizations, not personal accounts.


== `yamllint`

	- id: check-yaml
	  exclude: ^charts/base/templates/

== `yamlfmt`

https://github.com/google/yamlfmt/releases/tag/v0.16.0
yamlfmt -dry -output_format gitlab . >yamlfmt-report

=== pre-commit

- repo: https://github.com/google/yamlfmt
  rev: v0.14.0
  hooks:
    - id: yamlfmt


	yq '... comments=""| sort_keys(..)' values.yaml


== `doctoc`

https://github.com/google/yamlfmt/releases/tag/v0.16.0
yamlfmt -dry -output_format gitlab . >yamlfmt-report

=== pre-commit


	- id: doctoc
	  name: doctoc
	  language: node
	  entry: doctoc
	  types: [markdown]



#repos:
#  - repo: https://github.com/commitizen-tools/commitizen
#    rev: master
#    hooks:
#      - id: commitizen
#      - id: commitizen-branch
#        stages: [push]
