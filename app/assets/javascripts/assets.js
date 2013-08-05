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
      setSelect: [0, 0, 600, 600],
      onSelect: this.update,
      onChange: this.update
    });
  }

  AssetCropper.prototype.update = function(coords) {
    $('#user_crop_x').val(coords.x);
    $('#user_crop_y').val(coords.y);
    $('#user_crop_w').val(coords.w);
    return $('#user_crop_h').val(coords.h);
  };

  return AssetCropper;

})();
