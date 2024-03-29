stripeResponseHandler = (status, response) ->
  if response.error
    $("#payment_errors").text response.error.message
    if($("#payment_errors").is(":hidden"))
      console.log("toggle errors")
      $("#payment_errors").toggle()
    $("#user_submit").removeAttr "disabled"
  else
    form = $("#new_user")
    if form.length == 0
      form = $("#edit_user")
    token = response["id"]
    form.append "<input type='hidden' name='stripe_token' value='" + token + "'/>"
    console.log token
    form.get(0).submit()

$(document).ready ->
  $("#new_user").submit (event) ->
    $("#user_submit").attr "disabled", "disabled"
    Stripe.createToken
      number: $("#user_billing_credit_card_number").val()
      cvc: $("#user_billing_credit_card_cvc").val()
      exp_month: $("#user_billing_credit_card_exp_month").val()
      exp_year: $("#user_billing_credit_card_exp_year").val()
      name: $("#user_billing_credit_card_name").val()
    , stripeResponseHandler

    event.preventDefault()

$(document).ready ->
  $("#edit_user").submit (event) ->
    $("#user_submit").attr "disabled", "disabled"
    if $("#user_billing_credit_card_number").val() == ""
      form = $("#edit_user")
      form.get(0).submit
    else
      Stripe.createToken
        name: $("#user_billing_credit_card_name").val()
        number: $("#user_billing_credit_card_number").val()
        cvc: $("#user_billing_credit_card_cvc").val()
        exp_month: $("#user_billing_credit_card_exp_month").val()
        exp_year: $("#user_billing_credit_card_exp_year").val()
      , stripeResponseHandler

      event.preventDefault()


