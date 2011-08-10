#!/bin/bash
rake db:migrate
rails destroy migration drop_deal_builders_incentive_ideas_table

