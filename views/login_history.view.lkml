view: login_history {
  sql_table_name: @{DATABASE_NAME}.ACCOUNT_USAGE.LOGIN_HISTORY ;;

  # Field Descriptions from Snowflake Documentation: https://docs.snowflake.net/manuals/sql-reference/account-usage/login_history.html

  # DIMENSIONS #

  dimension: client_ip {
    type: string
    sql: ${TABLE}.CLIENT_IP ;;
    description: "IP address where the request originated from"
  }

  dimension: error_code {
    type: number
    sql: ${TABLE}.ERROR_CODE ;;
    description: "Error code, if the request was not successful"
  }

  dimension: error_message {
    type: string
    sql: ${TABLE}.ERROR_MESSAGE ;;
    description: "Error message returned to the user, if the request was not successful"
  }

  dimension: event_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.EVENT_ID ;;
    description: "Internal/system-generated identifier for the login attempt"
  }

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_month,
      day_of_week,
      day_of_year,
      week_of_year,
      week,
      month,
      quarter,
      year,
      second
    ]
    sql: ${TABLE}.EVENT_TIMESTAMP ;;
    description: "Time (in the UTC time zone) of the event occurrence"
  }

  dimension: event_type {
    type: number
    sql: ${TABLE}.EVENT_TYPE ;;
    description: "Event type, such as LOGIN for authentication events"
  }

  dimension: first_authentication_factor {
    type: number
    sql: ${TABLE}.FIRST_AUTHENTICATION_FACTOR ;;
    description: "Method used to authenticate the user (the first factor, if using multi factor authentication)"
  }

  dimension: is_success {
    type: yesno
    sql: CASE WHEN ${TABLE}.IS_SUCCESS = 'YES' THEN TRUE ELSE FALSE END;;
    description: "Whether the user’s request was successful or not"
  }

  dimension: related_event_id {
    type: number
    sql: ${TABLE}.RELATED_EVENT_ID ;;
    description: "Reserved for future use"
  }

  dimension: reported_client_type {
    type: string
    sql: ${TABLE}.REPORTED_CLIENT_TYPE ;;
    description: "Reported type of the client software, such as JDBC_DRIVER, ODBC_DRIVER, etc. This information is not authenticated"
  }

  dimension: reported_client_version {
    type: string
    sql: ${TABLE}.REPORTED_CLIENT_VERSION ;;
    description: "Reported version of the client software. This information is not authenticated"
  }

  dimension: second_authentication_factor {
    type: number
    sql: ${TABLE}.SECOND_AUTHENTICATION_FACTOR ;;
    description: "The second factor, if using multi factor authentication, or NULL otherwise"
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.USER_NAME ;;
    description: "User associated with this event"
  }

#   dimension: seconds_between_login_attempts {
#     type: number
#     sql: timediff(seconds, ${event_raw}, lead(${event_raw}) over(partition by ${user_name} order by ${event_raw})) ;;
#
#   }

  # MEASURES #

  measure: logins {
    type: count
    drill_fields: [user_name]
  }

  measure: total_failed_logins {
    type: count
    filters: {field: is_success value: "no"}
  }

  measure: login_failure_rate {
    type: number
    sql: 1.0 * (${total_failed_logins} /NULLIF(${logins},0)) ;;
    value_format_name: percent_2
  }

#   measure: average_seconds_between_login_attempts {
#     type: average
#     sql:  ${seconds_between_login_attempts} ;;
#   }

}
