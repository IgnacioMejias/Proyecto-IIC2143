# frozen_string_literal: true

require 'rails_helper'
include AuthHelper

RSpec.describe Request, type: :request do
  before(:all) do
    login_user
    @solicitud = create(:request)
    @solicitud.save
  end

  describe 'crear request' do
    it 'si tiene atributos válidos' do
      expect do
        post requests_path, params: {
          request: {
            request_date: @solicitud.request_date,
            product_id: @solicitud.product_id,
            days: @solicitud.days,
            user_id: @solicitud.user_id
          }
        }
      end.to change(Request, :count).by(1)
    end

    it 'no funciona si no tiene days ' do
      expect do
        post requests_path, params: {
          request: {
            request_date: @solicitud.request_date,
            product_id: @solicitud.product_id,
            days: -1,
            user_id: @solicitud.user_id
          }
        }
      end.to change(Request, :count).by(0)
    end
  end
  describe 'actualizar request' do
    it 'si nuevo days es válido' do
      patch request_path(@solicitud), params: {
        request: {
          request_date: @solicitud.request_date,
          product_id: @solicitud.product_id,
          days: 6,
          user_id: @solicitud.user_id
        }
      }
      expect(Request.find(@solicitud.id).days).to eq(6)
    end

    it 'si nuevo reques_date no es válido' do
      patch request_path(@solicitud), params: {
        request: {
          request_date: '',
          product_id: @solicitud.product_id,
          days: @solicitud.days,
          user_id: @solicitud.user_id
        }
      }
      expect(Request.find(@solicitud.id).request_date).to eq(@solicitud.request_date)
    end

    it 'si nuevo product_id no es válido' do
      patch request_path(@solicitud), params: {
        request: {
          request_date: @solicitud.request_date,
          product_id: '',
          days: @solicitud.days,
          user_id: @solicitud.user_id
        }
      }
      expect(Request.find(@solicitud.id).request_date).to eq(@solicitud.request_date)
    end
  end

  describe 'delete request' do
    it 'borra request si existe' do
      expect do
        delete request_path(@solicitud)
      end.to change(Request, :count).by(-1)
    end
  end
end
