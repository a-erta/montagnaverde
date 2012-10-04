//jQuery when DOM loads run this
$(function(){
    // We extend the Backbone.Model prototype to build our own
    window.Product = Backbone.Model.extend({
     
      // We can pass it default values.
      /*defaults : {
            title: "ciao",
            description: "stronzone", 
            image_url: "cane.jpg", 
            price: 1,
            quantity: 1
      },*/
     
      url : function() {
        // Important! It's got to know where to send its REST calls.
        // In this case, POST to '/products' and PUT to '/products/:id'
        return this.id ? '/products/' + this.id : '/products';
      } 
     
    });

    window.ProductCollection = Backbone.Collection.extend({
      model : Product,
      url : "/products"
    });
     
    window.Products = new ProductCollection;
     
    /*products.fetch({success: function(){
        products.each(function(product) {
            alert(product.get("description"));
            })
    }});*/

    //View

    window.ProductView = Backbone.View.extend({
        tagName: "tr",
  
        events: { 
            //Can be used for handling events on the template 
        },
  
        initialize: function(){
           //this.render();
        },
  
        render: function(){
            var product = this.model.toJSON();
            Template stuff goes here
           	$(this.el).html(ich.product_template(product));
            return this;
        }
    });
    
    
      //Application View

    window.AppView = Backbone.View.extend({

        el: $("#products_app"),

        events: {
            "submit form#new_product": "createProduct"
        },
        
        addOne: function(product) {
            var view = new ProductView({model: product});
            this.$("#product_table").append(view.render().el);
        },

        addAll: function(){
            Products.each(this.addOne);
        },

        initialize: function(){
            _.bindAll(this, 'addOne', 'addAll');

            Products.bind('add', this.addOne);
            Products.bind('refresh', this.addAll);
            Products.bind('all', this.render);

            Products.fetch({success: function(mod, response) {
                //alert("Thats cool: " + JSON.stringify(mod));
                Products.each( function(num){ 
                        //alert(num.get("description"));
                        //var view = new ProductView({model: num});
                       // this.$("#product_table").append(view.render().el);
                    } 
                );
            }}); //This Gets the Model from the Server
        },

        newAttributes: function(event) {
            var new_product_form = $(event.currentTarget).serializeObject();
            //alert (JSON.stringify(new_product_form));
            
            return {
                        title: new_product_form["product[title]"],
                        description: new_product_form["product[description]"], 
                        image_url: new_product_form["product[image_url]"], 
                        price: new_product_form["product[price]"], 
                        quantity: new_product_form["product[quantity]"]
                    };

        },

        createProduct: function(e) {
            e.preventDefault(); //This prevents the form from submitting normally

            var params = this.newAttributes(e);
            
            //alert(JSON.stringify(params));
            
            Products.create(params);
            
            //TODO - Clear the form fields after submitting
        }

    });
    
    //START THE BACKBONE APP
    window.App = new AppView;

});