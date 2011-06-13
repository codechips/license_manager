var License = Spine.Model.setup("License", ["key", "version", "product"]);

var LicenseItem = Spine.Controller.create({

  events : { ".destroy click" : "destroy" },

  destroy: function(e) {
    console.log("Boom!");
    e.preventDefault();
  },

  render: function(item) {
    this.item = item;
    this.el.html(this.template(this.item));
    console.log('hello from render');
    return this;
  },

  template: function(items){ 
    return($("#licenseTemplate").tmpl(items));
  },

});

var Licenses = Spine.Controller.create({

  proxied: ["addAll", "addOne"],


  init: function() {
    License.bind("refresh", this.addAll);
    License.bind("create", this.addOne);
  },

  addOne: function(item){
    var license = LicenseItem.init({item: item});
    this.el.append(license.render().el);
  },

  addAll: function(){
    License.each(this.addOne);
  }

});

var licenses = Licenses.init({el: $("#licenses")});

$(document).ready(function() {
});
