class CreateTranslations < ActiveRecord::Migration

  def self.up
    create_table :translations do |t|
      t.string :name
      t.text :value
      t.text :untranslated
      t.string :locale
      t.boolean :fresh
      t.string :freshness_key
      t.boolean :wym

      t.timestamps
    end

    add_index :translations, :id
  end

  def self.down
    UserPlugin.destroy_all({:name => "Translations"})

    Page.find_all_by_link_url("/translations").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/translations"})

    drop_table :translations
  end

end