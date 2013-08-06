// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


var AssetCropper,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

jQuery(function() {
  return new AssetCropper();
});

AssetCropper = (function() {

  function AssetCropper() {
    this.update = __bind(this.update, this);
    $('#cropbox').Jcrop({
      aspectRatio: 1,
      setSelect: [0, 0, 378, 378],
      onSelect: this.update,
      onChange: this.update
    });
  }

  AssetCropper.prototype.update = function(coords) {
    $('#asset_crop_x').val(coords.x);
    $('#asset_crop_y').val(coords.y);
    $('#asset_crop_w').val(coords.w);
    $('#asset_crop_h').val(coords.h);

  };

  return AssetCropper;

  var _this = this;

  ({
    updatePreview: function(coords) {
      return $('#preview').css({
        width: Math.round(100 / coords.w * $('#cropbox').width()) + 'px',
        height: Math.round(100 / coords.h * $('#cropbox').height()) + 'px',
        marginLeft: '-' + Math.round(100 / coords.w * coords.x) + 'px',
        marginTop: '-' + Math.round(100 / coords.h * coords.y) + 'px'
      });
    }
  });

})();
