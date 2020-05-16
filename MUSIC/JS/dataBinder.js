function DataBinder(object_id) {
    var pubSub = jQuery({});
    var data_attr = "bind-" + object_id,
        message = object_id + ":keyup";
    jQuery(document).on("keyup", "[data-" + data_attr + "]", function (evt) {
        var $input = jQuery(this);
        pubSub.trigger(message, [$input.attr("data-" + data_attr), $input.val()]);
    });
    pubSub.on(message, function (evt, prop_name, new_val) {
        jQuery("[data-" + data_attr + "=" + prop_name + "]").each(function () {
            var $bound = jQuery(this);
            if ($bound.is("input,textarea,select")) {
                $bound.val(new_val);
            }
            else {
                $bound.html(new_val);
            }
        });
    });
    return pubSub;
}

function DataBase(uid) {
    var binder = new DataBinder(uid),
        data = {
            attributes: {},
            set: function (attr_name, val) {
                this.attributes[attr_name] = val;
                binder.trigger(uid + ":keyup", [attr_name, val, this]);
            },

            get: function (attr_name) {
                return this.attributes[attr_name];
            },
            _binder: binder
        };

    return data;
}

//var user = new DataBase(0);
//user.set("name", "hello");