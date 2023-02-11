require 'swagger_helper'
describe 'Comment API' do
  path '/api/v1/users/9/posts/36/comments' do
    get 'Retrieves a comment' do
      tags 'Blogs', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string
      request_body_example value: { some_field: 'Foo' }, name: 'basic', summary: 'Request example description'

      response '200', 'blog found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 author_id: { type: :integer },
                 post_id: { type: :integer },
                 text: { type: :integer }
               },
               required: %w[id author_id post_id text]

        let(:id) { Comment.create(author_id: 1, post_id: 1, text: 'Comment').id }
        run_test!
      end

      response '404', 'blog not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end
end
