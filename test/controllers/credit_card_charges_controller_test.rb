require 'test_helper'

class CreditCardChargesControllerTest < ActionController::TestCase
  setup do
    @credit_card_charge = credit_card_charges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:credit_card_charges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create credit_card_charge" do
    assert_difference('CreditCardCharge.count') do
      post :create, credit_card_charge: { amount: @credit_card_charge.amount, currency: @credit_card_charge.currency, customer_id: @credit_card_charge.customer_id, paid: @credit_card_charge.paid, refunded: @credit_card_charge.refunded }
    end

    assert_redirected_to credit_card_charge_path(assigns(:credit_card_charge))
  end

  test "should show credit_card_charge" do
    get :show, id: @credit_card_charge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @credit_card_charge
    assert_response :success
  end

  test "should update credit_card_charge" do
    patch :update, id: @credit_card_charge, credit_card_charge: { amount: @credit_card_charge.amount, currency: @credit_card_charge.currency, customer_id: @credit_card_charge.customer_id, paid: @credit_card_charge.paid, refunded: @credit_card_charge.refunded }
    assert_redirected_to credit_card_charge_path(assigns(:credit_card_charge))
  end

  test "should destroy credit_card_charge" do
    assert_difference('CreditCardCharge.count', -1) do
      delete :destroy, id: @credit_card_charge
    end

    assert_redirected_to credit_card_charges_path
  end
end
