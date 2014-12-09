class AddAnthropometricsToMeasurements < ActiveRecord::Migration
  def change
    add_column :measurements, :height, :integer
    add_column :measurements, :weight, :float
    add_column :measurements, :waist, :integer
    add_column :measurements, :hip, :integer
    add_column :measurements, :bicep, :integer
    add_column :measurements, :thigh, :integer
    add_column :measurements, :chest, :integer
  end
end
