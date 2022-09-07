require 'spec_helper'
module Api::V1
  describe UsersController, type: :routing do
    it { expect(get: '/api/v1/users/new').to route_to(controller: "api/v1/users", "action"=>"new") }
    it { expect(get: '/api/v1/users').to route_to('api/v1/users#index') }

    it { expect(get: '/api/v1/users/1').to route_to('api/v1/users#show', id: '1') }
    it { expect(get: '/api/v1/users/1/edit').to route_to('api/v1/users#edit', id: '1') }
    it { expect(delete: '/api/v1/users/1').to route_to(controller: "api/v1/users", id: '1', "action"=>"destroy") }
  
    it "update action route" do
      expect(put("/api/v1/users/2")).to route_to(
        controller: 'api/v1/users',
        action: 'update',
        id: '2'
      )
    end
  end
end
