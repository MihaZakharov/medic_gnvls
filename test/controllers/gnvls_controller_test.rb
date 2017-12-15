require 'test_helper'

class GnvlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gnvl = gnvls(:one)
  end

  test "should get index" do
    get gnvls_url
    assert_response :success
  end

  test "should get new" do
    get new_gnvl_url
    assert_response :success
  end

  test "should create gnvl" do
    assert_difference('Gnvl.count') do
      post gnvls_url, params: { gnvl: { atx: @gnvl.atx, date_reg: @gnvl.date_reg, ean13: @gnvl.ean13, lekform: @gnvl.lekform, level_nac_opt: @gnvl.level_nac_opt, level_nac_rozn: @gnvl.level_nac_rozn, mnn: @gnvl.mnn, n_py: @gnvl.n_py, name: @gnvl.name, owner: @gnvl.owner, prc_first_pack: @gnvl.prc_first_pack, prc_wo_nds: @gnvl.prc_wo_nds, pred_opt_price: @gnvl.pred_opt_price, pred_rozn_price: @gnvl.pred_rozn_price, qntpack: @gnvl.qntpack } }
    end

    assert_redirected_to gnvl_url(Gnvl.last)
  end

  test "should show gnvl" do
    get gnvl_url(@gnvl)
    assert_response :success
  end

  test "should get edit" do
    get edit_gnvl_url(@gnvl)
    assert_response :success
  end

  test "should update gnvl" do
    patch gnvl_url(@gnvl), params: { gnvl: { atx: @gnvl.atx, date_reg: @gnvl.date_reg, ean13: @gnvl.ean13, lekform: @gnvl.lekform, level_nac_opt: @gnvl.level_nac_opt, level_nac_rozn: @gnvl.level_nac_rozn, mnn: @gnvl.mnn, n_py: @gnvl.n_py, name: @gnvl.name, owner: @gnvl.owner, prc_first_pack: @gnvl.prc_first_pack, prc_wo_nds: @gnvl.prc_wo_nds, pred_opt_price: @gnvl.pred_opt_price, pred_rozn_price: @gnvl.pred_rozn_price, qntpack: @gnvl.qntpack } }
    assert_redirected_to gnvl_url(@gnvl)
  end

  test "should destroy gnvl" do
    assert_difference('Gnvl.count', -1) do
      delete gnvl_url(@gnvl)
    end

    assert_redirected_to gnvls_url
  end
end
