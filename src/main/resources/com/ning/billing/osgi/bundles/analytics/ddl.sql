/*! SET storage_engine=INNODB */;

-- Subscription events
drop table if exists analytics_subscriptions;
create table analytics_subscriptions (
  record_id int(11) unsigned not null auto_increment
, subscription_event_record_id int(11) unsigned default null
, bundle_id char(36) default null
, bundle_external_key varchar(50) default null
, subscription_id char(36) default null
, requested_timestamp datetime default null
, event varchar(50) default null
, prev_product_name varchar(50) default null
, prev_product_type varchar(50) default null
, prev_product_category varchar(50) default null
, prev_slug varchar(50) default null
, prev_phase varchar(50) default null
, prev_billing_period varchar(50) default null
, prev_price numeric(10, 4) default 0
, converted_prev_price numeric(10, 4) default null
, prev_price_list varchar(50) default null
, prev_mrr numeric(10, 4) default 0
, converted_prev_mrr numeric(10, 4) default null
, prev_currency varchar(50) default null
, prev_service varchar(50) default null
, prev_state varchar(50) default null
, prev_business_active bool default true
, prev_start_date datetime default null
, next_product_name varchar(50) default null
, next_product_type varchar(50) default null
, next_product_category varchar(50) default null
, next_slug varchar(50) default null
, next_phase varchar(50) default null
, next_billing_period varchar(50) default null
, next_price numeric(10, 4) default 0
, converted_next_price numeric(10, 4) default null
, next_price_list varchar(50) default null
, next_mrr numeric(10, 4) default 0
, converted_next_mrr numeric(10, 4) default null
, next_currency varchar(50) default null
, next_service varchar(50) default null
, next_state varchar(50) default null
, next_business_active bool default true
, next_start_date datetime default null
, next_end_date datetime default null
, converted_currency char(3) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_subscriptions_bundle_id on analytics_subscriptions(bundle_id);
create index analytics_subscriptions_bundle_external_key on analytics_subscriptions(bundle_external_key);
create index analytics_subscriptions_account_id on analytics_subscriptions(account_id);
create index analytics_subscriptions_account_record_id on analytics_subscriptions(account_record_id);
create index analytics_subscriptions_tenant_account_record_id on analytics_subscriptions(tenant_record_id, account_record_id);

-- Bundle summary
drop table if exists analytics_bundles;
create table analytics_bundles (
  record_id int(11) unsigned not null auto_increment
, bundle_record_id int(11) unsigned default null
, bundle_id char(36) default null
, bundle_external_key varchar(50) default null
, subscription_id char(36) default null
, bundle_account_rank int(11) default null
, charged_through_date datetime default null
, current_product_name varchar(50) default null
, current_product_type varchar(50) default null
, current_product_category varchar(50) default null
, current_slug varchar(50) default null
, current_phase varchar(50) default null
, current_billing_period varchar(50) default null
, current_price numeric(10, 4) default 0
, converted_current_price numeric(10, 4) default null
, current_price_list varchar(50) default null
, current_mrr numeric(10, 4) default 0
, converted_current_mrr numeric(10, 4) default null
, current_currency varchar(50) default null
, current_service varchar(50) default null
, current_state varchar(50) default null
, current_business_active bool default true
, current_start_date datetime default null
, current_end_date datetime default null
, converted_currency char(3) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_bundles_bundle_bundle_id on analytics_bundles(bundle_id);
create index analytics_bundles_bundle_external_key on analytics_bundles(bundle_external_key);
create index analytics_bundles_account_id on analytics_bundles(account_id);
create index analytics_bundles_account_record_id on analytics_bundles(account_record_id);
create index analytics_bundles_tenant_account_record_id on analytics_bundles(tenant_record_id, account_record_id);

-- Accounts
drop table if exists analytics_accounts;
create table analytics_accounts (
  record_id int(11) unsigned not null auto_increment
, email varchar(128) default null
, first_name_length int(11) default null
, currency char(3) default null
, billing_cycle_day_local int default null
, payment_method_id char(36) default null
, time_zone varchar(50) default null
, locale varchar(5) default null
, address1 varchar(100) default null
, address2 varchar(100) default null
, company_name varchar(50) default null
, city varchar(50) default null
, state_or_province varchar(50) default null
, country varchar(50) default null
, postal_code varchar(16) default null
, phone varchar(25) default null
, migrated bool default false
, notified_for_invoices boolean default null
, balance numeric(10, 4) default 0
, converted_balance numeric(10, 4) default null
, oldest_unpaid_invoice_date date default null
, oldest_unpaid_invoice_balance numeric(10, 4) default null
, oldest_unpaid_invoice_currency char(3) default null
, converted_oldest_unpaid_invoice_balance numeric(10, 4) default null
, oldest_unpaid_invoice_id char(36) default null
, last_invoice_date date default null
, last_invoice_balance numeric(10, 4) default null
, last_invoice_currency char(3) default null
, converted_last_invoice_balance numeric(10, 4) default null
, last_invoice_id char(36) default null
, last_payment_date datetime default null
, last_payment_status varchar(255) default null
, nb_active_bundles int(11) default 0
, converted_currency char(3) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, updated_date datetime default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_accounts_account_external_key on analytics_accounts(account_external_key);
create index analytics_accounts_account_id on analytics_accounts(account_id);
create index analytics_accounts_account_record_id on analytics_accounts(account_record_id);
create index analytics_accounts_tenant_account_record_id on analytics_accounts(tenant_record_id, account_record_id);

-- Invoices
drop table if exists analytics_invoices;
create table analytics_invoices (
  record_id int(11) unsigned not null auto_increment
, invoice_record_id int(11) unsigned default null
, invoice_id char(36) default null
, invoice_number bigint default null
, invoice_date date default null
, target_date date default null
, currency char(50) default null
, balance numeric(10, 4) default 0
, converted_balance numeric(10, 4) default null
, amount_paid numeric(10, 4) default 0
, converted_amount_paid numeric(10, 4) default null
, amount_charged numeric(10, 4) default 0
, converted_amount_charged numeric(10, 4) default null
, original_amount_charged numeric(10, 4) default 0
, converted_original_amount_charged numeric(10, 4) default null
, amount_credited numeric(10, 4) default 0
, converted_amount_credited numeric(10, 4) default null
, amount_refunded numeric(10, 4) default 0
, converted_amount_refunded numeric(10, 4) default null
, converted_currency char(3) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_invoices_invoice_record_id on analytics_invoices(invoice_record_id);
create index analytics_invoices_invoice_id on analytics_invoices(invoice_id);
create index analytics_invoices_account_id on analytics_invoices(account_id);
create index analytics_invoices_account_record_id on analytics_invoices(account_record_id);
create index analytics_invoices_tenant_account_record_id on analytics_invoices(tenant_record_id, account_record_id);

-- Invoice adjustments (type REFUND_ADJ)
drop table if exists analytics_invoice_adjustments;
create table analytics_invoice_adjustments (
  record_id int(11) unsigned not null auto_increment
, invoice_item_record_id int(11) unsigned default null
, second_invoice_item_record_id int(11) unsigned default null
, item_id char(36) default null
, invoice_id char(36) default null
, invoice_number bigint default null
, invoice_created_date datetime default null
, invoice_date date default null
, invoice_target_date date default null
, invoice_currency char(50) default null
, invoice_balance numeric(10, 4) default 0
, converted_invoice_balance numeric(10, 4) default null
, invoice_amount_paid numeric(10, 4) default 0
, converted_invoice_amount_paid numeric(10, 4) default null
, invoice_amount_charged numeric(10, 4) default 0
, converted_invoice_amount_charged numeric(10, 4) default null
, invoice_original_amount_charged numeric(10, 4) default 0
, converted_invoice_original_amount_charged numeric(10, 4) default null
, invoice_amount_credited numeric(10, 4) default 0
, converted_invoice_amount_credited numeric(10, 4) default null
, invoice_amount_refunded numeric(10, 4) default 0
, converted_invoice_amount_refunded numeric(10, 4) default null
, item_type char(50) default null
, item_source enum('system', 'user') not null
, bundle_id char(36) default null
, bundle_external_key varchar(50) default null
, product_name varchar(50) default null
, product_type varchar(50) default null
, product_category varchar(50) default null
, slug varchar(50) default null
, phase varchar(50) default null
, billing_period varchar(50) default null
, start_date date default null
, end_date date default null
, amount numeric(10, 4) default 0
, converted_amount numeric(10, 4) default null
, currency char(50) default null
, linked_item_id char(36) default null
, converted_currency char(3) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_invoice_adjustments_invoice_item_record_id on analytics_invoice_adjustments(invoice_item_record_id);
create index analytics_invoice_adjustments_item_id on analytics_invoice_adjustments(item_id);
create index analytics_invoice_adjustments_invoice_id on analytics_invoice_adjustments(invoice_id);
create index analytics_invoice_adjustments_account_id on analytics_invoice_adjustments(account_id);
create index analytics_invoice_adjustments_account_record_id on analytics_invoice_adjustments(account_record_id);
create index analytics_invoice_adjustments_tenant_account_record_id on analytics_invoice_adjustments(tenant_record_id, account_record_id);

-- Invoice items (without adjustments, type EXTERNAL_CHARGE, FIXED and RECURRING)
drop table if exists analytics_invoice_items;
create table analytics_invoice_items (
  record_id int(11) unsigned not null auto_increment
, invoice_item_record_id int(11) unsigned default null
, second_invoice_item_record_id int(11) unsigned default null
, item_id char(36) default null
, invoice_id char(36) default null
, invoice_number bigint default null
, invoice_created_date datetime default null
, invoice_date date default null
, invoice_target_date date default null
, invoice_currency char(50) default null
, invoice_balance numeric(10, 4) default 0
, converted_invoice_balance numeric(10, 4) default null
, invoice_amount_paid numeric(10, 4) default 0
, converted_invoice_amount_paid numeric(10, 4) default null
, invoice_amount_charged numeric(10, 4) default 0
, converted_invoice_amount_charged numeric(10, 4) default null
, invoice_original_amount_charged numeric(10, 4) default 0
, converted_invoice_original_amount_charged numeric(10, 4) default null
, invoice_amount_credited numeric(10, 4) default 0
, converted_invoice_amount_credited numeric(10, 4) default null
, invoice_amount_refunded numeric(10, 4) default 0
, converted_invoice_amount_refunded numeric(10, 4) default null
, item_type char(50) default null
, item_source enum('system', 'user') not null
, bundle_id char(36) default null
, bundle_external_key varchar(50) default null
, product_name varchar(50) default null
, product_type varchar(50) default null
, product_category varchar(50) default null
, slug varchar(50) default null
, phase varchar(50) default null
, billing_period varchar(50) default null
, start_date date default null
, end_date date default null
, amount numeric(10, 4) default 0
, converted_amount numeric(10, 4) default null
, currency char(50) default null
, linked_item_id char(36) default null
, converted_currency char(3) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_invoice_items_invoice_item_record_id on analytics_invoice_items(invoice_item_record_id);
create index analytics_invoice_items_item_id on analytics_invoice_items(item_id);
create index analytics_invoice_items_invoice_id on analytics_invoice_items(invoice_id);
create index analytics_invoice_items_account_id on analytics_invoice_items(account_id);
create index analytics_invoice_items_account_record_id on analytics_invoice_items(account_record_id);
create index analytics_invoice_items_tenant_account_record_id on analytics_invoice_items(tenant_record_id, account_record_id);

-- Invoice items adjustments (type ITEM_ADJ)
drop table if exists analytics_invoice_item_adjustments;
create table analytics_invoice_item_adjustments (
  record_id int(11) unsigned not null auto_increment
, invoice_item_record_id int(11) unsigned default null
, second_invoice_item_record_id int(11) unsigned default null
, item_id char(36) default null
, invoice_id char(36) default null
, invoice_number bigint default null
, invoice_created_date datetime default null
, invoice_date date default null
, invoice_target_date date default null
, invoice_currency char(50) default null
, invoice_balance numeric(10, 4) default 0
, converted_invoice_balance numeric(10, 4) default null
, invoice_amount_paid numeric(10, 4) default 0
, converted_invoice_amount_paid numeric(10, 4) default null
, invoice_amount_charged numeric(10, 4) default 0
, converted_invoice_amount_charged numeric(10, 4) default null
, invoice_original_amount_charged numeric(10, 4) default 0
, converted_invoice_original_amount_charged numeric(10, 4) default null
, invoice_amount_credited numeric(10, 4) default 0
, converted_invoice_amount_credited numeric(10, 4) default null
, invoice_amount_refunded numeric(10, 4) default 0
, converted_invoice_amount_refunded numeric(10, 4) default null
, item_type char(50) default null
, item_source enum('system', 'user') not null
, bundle_id char(36) default null
, bundle_external_key varchar(50) default null
, product_name varchar(50) default null
, product_type varchar(50) default null
, product_category varchar(50) default null
, slug varchar(50) default null
, phase varchar(50) default null
, billing_period varchar(50) default null
, start_date date default null
, end_date date default null
, amount numeric(10, 4) default 0
, converted_amount numeric(10, 4) default null
, currency char(50) default null
, linked_item_id char(36) default null
, converted_currency char(3) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_invoice_item_adjustments_invoice_item_record_id on analytics_invoice_item_adjustments(invoice_item_record_id);
create index analytics_invoice_item_adjustments_item_id on analytics_invoice_item_adjustments(item_id);
create index analytics_invoice_item_adjustments_invoice_id on analytics_invoice_item_adjustments(invoice_id);
create index analytics_invoice_item_adjustments_account_id on analytics_invoice_item_adjustments(account_id);
create index analytics_invoice_item_adjustments_account_record_id on analytics_invoice_item_adjustments(account_record_id);
create index analytics_invoice_item_adjustments_tenant_account_record_id on analytics_invoice_item_adjustments(tenant_record_id, account_record_id);

-- Account credits (type CBA_ADJ and CREDIT_ADJ)
drop table if exists analytics_invoice_credits;
create table analytics_invoice_credits (
  record_id int(11) unsigned not null auto_increment
, invoice_item_record_id int(11) unsigned default null
, second_invoice_item_record_id int(11) unsigned default null
, item_id char(36) default null
, invoice_id char(36) default null
, invoice_number bigint default null
, invoice_created_date datetime default null
, invoice_date date default null
, invoice_target_date date default null
, invoice_currency char(50) default null
, invoice_balance numeric(10, 4) default 0
, converted_invoice_balance numeric(10, 4) default null
, invoice_amount_paid numeric(10, 4) default 0
, converted_invoice_amount_paid numeric(10, 4) default null
, invoice_amount_charged numeric(10, 4) default 0
, converted_invoice_amount_charged numeric(10, 4) default null
, invoice_original_amount_charged numeric(10, 4) default 0
, converted_invoice_original_amount_charged numeric(10, 4) default null
, invoice_amount_credited numeric(10, 4) default 0
, converted_invoice_amount_credited numeric(10, 4) default null
, invoice_amount_refunded numeric(10, 4) default 0
, converted_invoice_amount_refunded numeric(10, 4) default null
, item_type char(50) default null
, item_source enum('system', 'user') not null
, bundle_id char(36) default null
, bundle_external_key varchar(50) default null
, product_name varchar(50) default null
, product_type varchar(50) default null
, product_category varchar(50) default null
, slug varchar(50) default null
, phase varchar(50) default null
, billing_period varchar(50) default null
, start_date date default null
, end_date date default null
, amount numeric(10, 4) default 0
, converted_amount numeric(10, 4) default null
, currency char(50) default null
, linked_item_id char(36) default null
, converted_currency char(3) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_invoice_credits_invoice_item_record_id on analytics_invoice_credits(invoice_item_record_id);
create index analytics_invoice_credits_item_id on analytics_invoice_credits(item_id);
create index analytics_invoice_credits_invoice_id on analytics_invoice_credits(invoice_id);
create index analytics_invoice_credits_account_id on analytics_invoice_credits(account_id);
create index analytics_invoice_credits_account_record_id on analytics_invoice_credits(account_record_id);
create index analytics_invoice_credits_tenant_account_record_id on analytics_invoice_credits(tenant_record_id, account_record_id);

-- Invoice payments
drop table if exists analytics_payments;
create table analytics_payments (
  record_id int(11) unsigned not null auto_increment
, invoice_payment_record_id int(11) unsigned default null
, invoice_payment_id char(36) default null
, invoice_id char(36) default null
, invoice_number bigint default null
, invoice_created_date datetime default null
, invoice_date date default null
, invoice_target_date date default null
, invoice_currency char(50) default null
, invoice_balance numeric(10, 4) default 0
, converted_invoice_balance numeric(10, 4) default null
, invoice_amount_paid numeric(10, 4) default 0
, converted_invoice_amount_paid numeric(10, 4) default null
, invoice_amount_charged numeric(10, 4) default 0
, converted_invoice_amount_charged numeric(10, 4) default null
, invoice_original_amount_charged numeric(10, 4) default 0
, converted_invoice_original_amount_charged numeric(10, 4) default null
, invoice_amount_credited numeric(10, 4) default 0
, converted_invoice_amount_credited numeric(10, 4) default null
, invoice_amount_refunded numeric(10, 4) default 0
, converted_invoice_amount_refunded numeric(10, 4) default null
, invoice_payment_type varchar(50) default null
, payment_id char(36) default null
, payment_number bigint default null
, linked_invoice_payment_id char(36) default null
, amount numeric(10, 4) default 0
, converted_amount numeric(10, 4) default null
, currency char(50) default null
, plugin_name varchar(255) default null
, plugin_created_date datetime default null
, plugin_effective_date datetime default null
, plugin_status varchar(255) default null
, plugin_gateway_error varchar(255) default null
, plugin_gateway_error_code varchar(255) default null
, plugin_first_reference_id varchar(255) default null
, plugin_second_reference_id varchar(255) default null
, plugin_pm_id varchar(255) default null
, plugin_pm_is_default bool default null
, plugin_pm_type varchar(255) default null
, plugin_pm_cc_name varchar(255) default null
, plugin_pm_cc_type varchar(255) default null
, plugin_pm_cc_expiration_month varchar(255) default null
, plugin_pm_cc_expiration_year varchar(255) default null
, plugin_pm_cc_last_4 varchar(255) default null
, plugin_pm_address1 varchar(255) default null
, plugin_pm_address2 varchar(255) default null
, plugin_pm_city varchar(255) default null
, plugin_pm_state varchar(255) default null
, plugin_pm_zip varchar(255) default null
, plugin_pm_country varchar(255) default null
, converted_currency char(3) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_payments_invoice_payment_record_id on analytics_payments(invoice_payment_record_id);
create index analytics_payments_invoice_payment_id on analytics_payments(invoice_payment_id);
create index analytics_payments_invoice_id on analytics_payments(invoice_id);
create index analytics_payments_account_id on analytics_payments(account_id);
create index analytics_payments_account_record_id on analytics_payments(account_record_id);
create index analytics_payments_tenant_account_record_id on analytics_payments(tenant_record_id, account_record_id);

-- Invoice refunds
drop table if exists analytics_refunds;
create table analytics_refunds (
  record_id int(11) unsigned not null auto_increment
, invoice_payment_record_id int(11) unsigned default null
, invoice_payment_id char(36) default null
, invoice_id char(36) default null
, invoice_number bigint default null
, invoice_created_date datetime default null
, invoice_date date default null
, invoice_target_date date default null
, invoice_currency char(50) default null
, invoice_balance numeric(10, 4) default 0
, converted_invoice_balance numeric(10, 4) default null
, invoice_amount_paid numeric(10, 4) default 0
, converted_invoice_amount_paid numeric(10, 4) default null
, invoice_amount_charged numeric(10, 4) default 0
, converted_invoice_amount_charged numeric(10, 4) default null
, invoice_original_amount_charged numeric(10, 4) default 0
, converted_invoice_original_amount_charged numeric(10, 4) default null
, invoice_amount_credited numeric(10, 4) default 0
, converted_invoice_amount_credited numeric(10, 4) default null
, invoice_amount_refunded numeric(10, 4) default 0
, converted_invoice_amount_refunded numeric(10, 4) default null
, invoice_payment_type varchar(50) default null
, payment_id char(36) default null
, refund_id char(36) default null
, payment_number bigint default null
, linked_invoice_payment_id char(36) default null
, amount numeric(10, 4) default 0
, converted_amount numeric(10, 4) default null
, currency char(50) default null
, plugin_name varchar(255) default null
, plugin_created_date datetime default null
, plugin_effective_date datetime default null
, plugin_status varchar(255) default null
, plugin_gateway_error varchar(255) default null
, plugin_gateway_error_code varchar(255) default null
, plugin_first_reference_id varchar(255) default null
, plugin_second_reference_id varchar(255) default null
, plugin_pm_id varchar(255) default null
, plugin_pm_is_default bool default null
, plugin_pm_type varchar(255) default null
, plugin_pm_cc_name varchar(255) default null
, plugin_pm_cc_type varchar(255) default null
, plugin_pm_cc_expiration_month varchar(255) default null
, plugin_pm_cc_expiration_year varchar(255) default null
, plugin_pm_cc_last_4 varchar(255) default null
, plugin_pm_address1 varchar(255) default null
, plugin_pm_address2 varchar(255) default null
, plugin_pm_city varchar(255) default null
, plugin_pm_state varchar(255) default null
, plugin_pm_zip varchar(255) default null
, plugin_pm_country varchar(255) default null
, converted_currency char(3) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_refunds_invoice_payment_record_id on analytics_refunds(invoice_payment_record_id);
create index analytics_refunds_invoice_payment_id on analytics_refunds(invoice_payment_id);
create index analytics_refunds_invoice_id on analytics_refunds(invoice_id);
create index analytics_refunds_account_id on analytics_refunds(account_id);
create index analytics_refunds_account_record_id on analytics_refunds(account_record_id);
create index analytics_refunds_tenant_account_record_id on analytics_refunds(tenant_record_id, account_record_id);

-- Invoice payment chargebacks
drop table if exists analytics_chargebacks;
create table analytics_chargebacks (
  record_id int(11) unsigned not null auto_increment
, invoice_payment_record_id int(11) unsigned default null
, invoice_payment_id char(36) default null
, invoice_id char(36) default null
, invoice_number bigint default null
, invoice_created_date datetime default null
, invoice_date date default null
, invoice_target_date date default null
, invoice_currency char(50) default null
, invoice_balance numeric(10, 4) default 0
, converted_invoice_balance numeric(10, 4) default null
, invoice_amount_paid numeric(10, 4) default 0
, converted_invoice_amount_paid numeric(10, 4) default null
, invoice_amount_charged numeric(10, 4) default 0
, converted_invoice_amount_charged numeric(10, 4) default null
, invoice_original_amount_charged numeric(10, 4) default 0
, converted_invoice_original_amount_charged numeric(10, 4) default null
, invoice_amount_credited numeric(10, 4) default 0
, converted_invoice_amount_credited numeric(10, 4) default null
, invoice_amount_refunded numeric(10, 4) default 0
, converted_invoice_amount_refunded numeric(10, 4) default null
, invoice_payment_type varchar(50) default null
, payment_id char(36) default null
, payment_number bigint default null
, linked_invoice_payment_id char(36) default null
, amount numeric(10, 4) default 0
, converted_amount numeric(10, 4) default null
, currency char(50) default null
, plugin_name varchar(255) default null
, plugin_created_date datetime default null
, plugin_effective_date datetime default null
, plugin_status varchar(255) default null
, plugin_gateway_error varchar(255) default null
, plugin_gateway_error_code varchar(255) default null
, plugin_first_reference_id varchar(255) default null
, plugin_second_reference_id varchar(255) default null
, plugin_pm_id varchar(255) default null
, plugin_pm_is_default bool default null
, plugin_pm_type varchar(255) default null
, plugin_pm_cc_name varchar(255) default null
, plugin_pm_cc_type varchar(255) default null
, plugin_pm_cc_expiration_month varchar(255) default null
, plugin_pm_cc_expiration_year varchar(255) default null
, plugin_pm_cc_last_4 varchar(255) default null
, plugin_pm_address1 varchar(255) default null
, plugin_pm_address2 varchar(255) default null
, plugin_pm_city varchar(255) default null
, plugin_pm_state varchar(255) default null
, plugin_pm_zip varchar(255) default null
, plugin_pm_country varchar(255) default null
, converted_currency char(3) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_chargebacks_invoice_payment_record_id on analytics_chargebacks(invoice_payment_record_id);
create index analytics_chargebacks_invoice_payment_id on analytics_chargebacks(invoice_payment_id);
create index analytics_chargebacks_invoice_id on analytics_chargebacks(invoice_id);
create index analytics_chargebacks_account_id on analytics_chargebacks(account_id);
create index analytics_chargebacks_account_record_id on analytics_chargebacks(account_record_id);
create index analytics_chargebacks_tenant_account_record_id on analytics_chargebacks(tenant_record_id, account_record_id);

drop table if exists analytics_entitlement_states;
create table analytics_entitlement_states (
  record_id int(11) unsigned not null auto_increment
, blocking_state_record_id int(11) unsigned default null
, status varchar(50) default null
, start_date datetime default null
, end_date datetime default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_entitlement_states_account_id on analytics_entitlement_states(account_id);
create index analytics_entitlement_states_account_record_id on analytics_entitlement_states(account_record_id);
create index analytics_entitlement_states_tenant_account_record_id on analytics_entitlement_states(tenant_record_id, account_record_id);

drop table if exists analytics_account_tags;
create table analytics_account_tags (
  record_id int(11) unsigned not null auto_increment
, tag_record_id int(11) unsigned default null
, name varchar(50) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_account_tags_account_id on analytics_account_tags(account_id);
create index analytics_account_tags_account_record_id on analytics_account_tags(account_record_id);
create index analytics_account_tags_tenant_account_record_id on analytics_account_tags(tenant_record_id, account_record_id);

drop table if exists analytics_bundle_tags;
create table analytics_bundle_tags (
  record_id int(11) unsigned not null auto_increment
, tag_record_id int(11) unsigned default null
, bundle_id char(36) default null
, name varchar(50) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_bundle_tags_account_id on analytics_bundle_tags(account_id);
create index analytics_bundle_tags_account_record_id on analytics_bundle_tags(account_record_id);
create index analytics_bundle_tags_tenant_account_record_id on analytics_bundle_tags(tenant_record_id, account_record_id);

drop table if exists analytics_invoice_tags;
create table analytics_invoice_tags (
  record_id int(11) unsigned not null auto_increment
, tag_record_id int(11) unsigned default null
, invoice_id char(36) default null
, name varchar(50) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_invoice_tags_account_id on analytics_invoice_tags(account_id);
create index analytics_invoice_tags_account_record_id on analytics_invoice_tags(account_record_id);
create index analytics_invoice_tags_tenant_account_record_id on analytics_invoice_tags(tenant_record_id, account_record_id);

drop table if exists analytics_payment_tags;
create table analytics_payment_tags (
  record_id int(11) unsigned not null auto_increment
, tag_record_id int(11) unsigned default null
, invoice_payment_id char(36) default null
, name varchar(50) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_payment_tags_account_id on analytics_payment_tags(account_id);
create index analytics_payment_tags_account_record_id on analytics_payment_tags(account_record_id);
create index analytics_payment_tags_tenant_account_record_id on analytics_payment_tags(tenant_record_id, account_record_id);

drop table if exists analytics_account_fields;
create table analytics_account_fields (
  record_id int(11) unsigned not null auto_increment
, custom_field_record_id int(11) unsigned default null
, name varchar(50) default null
, value varchar(255) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_account_fields_account_id on analytics_account_fields(account_id);
create index analytics_account_fields_account_record_id on analytics_account_fields(account_record_id);
create index analytics_account_fields_tenant_account_record_id on analytics_account_fields(tenant_record_id, account_record_id);

drop table if exists analytics_bundle_fields;
create table analytics_bundle_fields (
  record_id int(11) unsigned not null auto_increment
, custom_field_record_id int(11) unsigned default null
, bundle_id char(36) default null
, name varchar(50) default null
, value varchar(255) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_bundle_fields_account_id on analytics_bundle_fields(account_id);
create index analytics_bundle_fields_account_record_id on analytics_bundle_fields(account_record_id);
create index analytics_bundle_fields_tenant_account_record_id on analytics_bundle_fields(tenant_record_id, account_record_id);

drop table if exists analytics_invoice_fields;
create table analytics_invoice_fields (
  record_id int(11) unsigned not null auto_increment
, custom_field_record_id int(11) unsigned default null
, invoice_id char(36) default null
, name varchar(50) default null
, value varchar(255) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_invoice_fields_account_id on analytics_invoice_fields(account_id);
create index analytics_invoice_fields_account_record_id on analytics_invoice_fields(account_record_id);
create index analytics_invoice_fields_tenant_account_record_id on analytics_invoice_fields(tenant_record_id, account_record_id);

drop table if exists analytics_payment_fields;
create table analytics_payment_fields (
  record_id int(11) unsigned not null auto_increment
, custom_field_record_id int(11) unsigned default null
, invoice_payment_id char(36) default null
, name varchar(50) default null
, value varchar(255) default null
, created_date datetime default null
, created_by varchar(50) default null
, created_reason_code varchar(255) default null
, created_comments varchar(255) default null
, account_id char(36) default null
, account_name varchar(100) default null
, account_external_key varchar(50) default null
, account_record_id int(11) unsigned default null
, tenant_record_id int(11) unsigned default null
, report_group enum('default', 'test', 'partner') not null
, primary key(record_id)
);
create index analytics_payment_fields_account_id on analytics_payment_fields(account_id);
create index analytics_payment_fields_account_record_id on analytics_payment_fields(account_record_id);
create index analytics_payment_fields_tenant_account_record_id on analytics_payment_fields(tenant_record_id, account_record_id);

drop table if exists analytics_notifications;
create table analytics_notifications (
  record_id int(11) unsigned not null auto_increment
, class_name varchar(256) not null
, event_json varchar(2048) not null
, user_token char(36)
, created_date datetime not null
, creating_owner char(50) not null
, processing_owner char(50) default null
, processing_available_date datetime default null
, processing_state varchar(14) default 'AVAILABLE'
, search_key1 int(11) unsigned default null
, search_key2 int(11) unsigned default null
, queue_name char(64) not null
, effective_date datetime not null
, future_user_token char(36)
, primary key(record_id)
);
create index idx_comp_where on analytics_notifications(effective_date, processing_state, processing_owner, processing_available_date);
create index idx_update on analytics_notifications(processing_state,processing_owner,processing_available_date);
create index idx_get_ready on analytics_notifications(effective_date,created_date);
create index notifications_search_keys on analytics_notifications(search_key2, search_key1);

drop table if exists analytics_notifications_history;
create table analytics_notifications_history (
  record_id int(11) unsigned not null auto_increment
, class_name varchar(256) not null
, event_json varchar(2048) not null
, user_token char(36)
, created_date datetime not null
, creating_owner char(50) not null
, processing_owner char(50) default null
, processing_available_date datetime default null
, processing_state varchar(14) default 'AVAILABLE'
, search_key1 int(11) unsigned default null
, search_key2 int(11) unsigned default null
, queue_name char(64) not null
, effective_date datetime not null
, future_user_token char(36)
, primary key(record_id)
);

drop table if exists analytics_currency_conversion;
create table analytics_currency_conversion (
  record_id int(11) unsigned not null auto_increment
, currency char(3) not null
, start_date date not null
, end_date date not null
, reference_rate decimal(10, 4) not null
, reference_currency char(3) default 'USD'
, primary key(record_id)
);
create index idx_comp_where on analytics_currency_conversion(start_date, end_date, currency, reference_currency);

drop table if exists analytics_reports;
create table analytics_reports (
  record_id int(11) unsigned not null auto_increment
, report_name varchar(100) not null
, report_pretty_name varchar(256) default null
, source_table_name varchar(256) not null
, refresh_procedure_name varchar(256) default null
, refresh_frequency enum('HOURLY', 'DAILY') default null
, refresh_hour_of_day_gmt tinyint default null
, primary key(record_id)
);
create unique index analytics_reports_report_name on analytics_reports(report_name(100));
