#!/bin/bash
rake db:migrate:down VERSION="20110711230431_add_level_of_new_business_to_review_entries.rb"
rake db:migrate:down VERSION="20110711230351_add_offer_to_review_entries.rb  "
rake db:migrate:down VERSION="20110711223136_add_number_of_vouchers_to_review_entries.rb "
rake db:migrate:down VERSION="20110711173618_add_content_to_tutorials.rb "
rake db:migrate:down VERSION="20110711173455_add_topic_to_tutorials.rb "
rails destroy migration add_level_of_new_business_to_review_entries level_of_new_business:integer
rails destroy migration add_offer_to_review_entries offer:text
rails destroy migration add_number_of_vouchers_to_review_entries number_of_vouchers:integer
rails destroy migration add_content_to_tutorials content:text
rails destroy migration add_topic_to_tutorials topic:string



