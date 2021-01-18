require 'rails_helper'

RSpec.describe 'Measures', type: :request do
  # initialize test data
  let(:user) { create(:user) }
  let!(:measures) { create_list(:measure, 10) }
  let(:measure_id) { measures.first.id }
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /measures
  describe 'GET /measures' do
    # make HTTP get request before each example
    # update request with headers
    before { get '/measures', params: {}, headers: headers }

    it 'returns measures' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /measures/:id
  describe 'GET /measures/:id' do
    before { get "/measures/#{measure_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the measure' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(measure_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:measure_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Measure/)
      end
    end
  end

  # Test suite for POST /measures
  describe 'POST /measures' do
    # valid payload
    let(:valid_attributes) do
      # send json payload
      { title: 'Crunches', unit: 'reps', video: 'http://youtube.com/video' }.to_json
    end

    context 'when the request is valid' do
      before { post '/measures', params: valid_attributes, headers: headers }

      it 'creates a measure' do
        expect(json['title']).to eq('Crunches')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post '/measures', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Title can't be blank, Unit can't be blank, Video can't be blank/)
      end
    end
  end

  # Test suite for PUT /measures/:id
  describe 'PUT /measures/:id' do
    let(:valid_attributes) { { title: 'Crunches', unit: 'reps', video: 'http://youtube.com/video' }.to_json }

    context 'when the record exists' do
      before { put "/measures/#{measure_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /measures/:id
  describe 'DELETE /measures/:id' do
    before { delete "/measures/#{measure_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
