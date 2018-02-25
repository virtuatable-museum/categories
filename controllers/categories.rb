module Controllers
  # Controller for the categories of rights, mapped on /categories
  # @author Vincent Courtois <courtois.vincent@outlook.com>
  class Categories < Arkaan::Utils::Controller

    # @see https://github.com/jdr-tools/categories/wiki/Creation-of-a-category
    declare_route 'post', '/' do
      check_presence 'slug'
      category = Arkaan::Permissions::Category.new(slug: params['slug'])
      if category.save
        halt 201, {message: 'created'}.to_json
      else
        halt 422, {errors: category.errors.messages.values.flatten}.to_json
      end
    end

    # @see https://github.com/jdr-tools/categories/wiki/Deleting-a-category
    declare_route 'delete', '/:id' do
      category = Arkaan::Permissions::Category.where(id: params[:id]).first
      if category.nil?
        halt 404, {message: 'category_not_found'}.to_json
      else
        category.rights.delete_all if category.rights.any?
        category.delete
        halt 200, {message: 'deleted'}.to_json
      end
    end

    # @see https://github.com/jdr-tools/categories/wiki/Getting-the-list-of-categories
    declare_route 'get', '/' do
      categories = Decorators::Category.decorate_collection(Arkaan::Permissions::Category.all)
      halt 200, {count: Arkaan::Permissions::Category.count, items: categories.map(&:to_h)}.to_json
    end
  end
end