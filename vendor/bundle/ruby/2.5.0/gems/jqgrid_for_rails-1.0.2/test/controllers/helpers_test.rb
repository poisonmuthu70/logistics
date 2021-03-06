require 'test/test_helper'

class MockController < ApplicationController
end

class ControllerHelpersTest < ActionController::TestCase

  def setup
    @controller = MockController.new
  end

  tests MockController

  test "order_by_from with sidx and sord" do
    params = {'sidx' => 'updated_at', 'sord' => 'desc' }
    assert_equal 'updated_at desc', @controller.order_by_from_params(params)
  end

  test "order_by_from with sidx" do
    params = {'sidx' => 'updated_at'}
    assert_equal 'updated_at', @controller.order_by_from_params(params)
  end

  test "order_by_from without sidx" do
    params = {'sord' => 'desc' }
    assert_nil @controller.order_by_from_params(params)
  end

  test "order_by_from with blank sidx" do
    params = {'sidx' => ''}
    assert_nil @controller.order_by_from_params(params)
  end

  test "order_by_from with quoting char" do
    params = {'sidx' => 'updated_at', 'sord' => 'desc'}
    assert_equal '`updated_at` desc', @controller.order_by_from_params(params, '`')
  end

  test "json_for_grid with empty records result" do
    records = Invoice.paginate(:page => 1)
    json    = @controller.json_for_jqgrid(records)
    hash    = ActiveSupport::JSON.decode(json)
    assert_equal 0, hash['total']
    assert_equal [], hash['rows']
    assert_equal 1, hash['page']
    assert_equal 0, hash['records']
  end

  test "json_for_grid with one record and id prefix" do
    tmp_record  = Invoice.create({:invid => 1, :invdate => '2011-01-01 00:00:00', :amount => 10, :tax => 1, :total => 11, :note => '' })
    records     = Invoice.paginate(:page => 1)
    json        = @controller.json_for_jqgrid(records, ['amount', 'total' ], {:id_column => 'invid', :id_prefix => 'mygrid_row_'})
    hash        = ActiveSupport::JSON.decode(json)
    Invoice.delete(tmp_record.id)
    assert_equal 1, hash["total"]
    assert_equal 1, hash["page"]
    assert_equal 1, hash["records"]
    assert_equal [10.0, 11.0], hash["rows"][0]["cell"]
    assert_equal "mygrid_row_1", hash["rows"][0]["id"]
  end

  test "json_for_jqgrid with proc for id_column" do
    tmp_record  = Invoice.create({:invid => 1, :invdate => '2011-01-01 00:00:00', :amount => 10, :tax => 1, :total => 11, :note => '' })
    records     = Invoice.paginate(:page => 1)
    my_proc     = Proc.new { |r| "invid_#{r.invid}" }
    json        = @controller.json_for_jqgrid(records, ['invdate', 'amount', 'total' ], {:id_column => my_proc })
    hash        = ActiveSupport::JSON.decode(json)
    Invoice.delete(tmp_record.id)

    assert_equal 'invid_1', hash["rows"].first["id"]
  end

  test "json_for_jqgrid should allow to format field with a proc" do
    tmp_record  = Invoice.create({:invid => 1, :invdate => '2011-01-01 00:00:00', :amount => 10, :tax => 1, :total => 11, :note => '123,456.123' })
    records     = Invoice.paginate(:page => 1)
    my_proc     = Proc.new { |r| (r.gsub(/,/, '').to_f) }
    json        = @controller.json_for_jqgrid(records, ['invdate', 'amount', 'total', 'note' ], {:format => {'note' => my_proc }})
    hash        = ActiveSupport::JSON.decode(json)
    Invoice.delete(tmp_record.id)

    assert_equal 123456.123, hash["rows"].first["cell"].last
  end

  test "json_for_jqgrid should allow to format many fields with a proc" do
    tmp_record  = Invoice.create({:invid => 1, :invdate => '2011-01-01 00:00:00', :amount => 10, :tax => 1, :total => 11, :note => '123,456.123' })
    records     = Invoice.paginate(:page => 1)
    my_proc     = Proc.new { |r| (r * 2) }
    json        = @controller.json_for_jqgrid(records, ['invdate', 'amount', 'total', 'note' ], {:format => {['amount', 'total'] => my_proc }})
    hash        = ActiveSupport::JSON.decode(json)
    Invoice.delete(tmp_record.id)

    assert_equal 20, hash["rows"].first["cell"][1]
    assert_equal 22, hash["rows"].first["cell"][2]
  end


end
