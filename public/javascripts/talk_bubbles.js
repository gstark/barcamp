/* Many thanks for the code, styles and images from: http://css.dzone.com/news/coda-popup-bubbles */

$(function ()
{
  $('.talk').each(function ()
  {
    // options
    var distance       = 10;
    var time           = 250;
    var hideDelay      = 0;
    var hideDelayTimer = null;

    // tracker
    var beingShown = false;
    var shown      = false;
    
    var trigger = $('.talk_brief', this);
    var popup   = $('.talk_details', this).css('opacity', 0);

    // set the mouseover and mouseout on both element
    $([trigger.get(0), popup.get(0)]).mouseover(
      function ()
      {
        // stops the hide event if we move from the trigger to the popup element
        if (hideDelayTimer)
        {
          clearTimeout(hideDelayTimer); 
        }

        // don't trigger the animation again if we're being shown, or already visible
        if (beingShown || shown)
        {
          return;
        }
        else
        {
          beingShown = true;

          // reset position of popup box
          popup.css( {
                        top:      -popup.height()+ 20,
                        left:     90,
                        display:  'block' // brings the popup back in to view
                      })

          // (we're using chaining on the popup) now animate it's opacity and position
          .animate( {
                      top:      '-=' + distance + 'px',
                      opacity:  1
                    }, 
                    time, 
                    'swing', 
                    function()
                    {
                      // once the animation is complete, set the tracker variables
                      beingShown = false;
                      shown      = true;
                    } );
        }
      }
    ).mouseout(function()
      {
        // reset the timer if we get fired again - avoids double animations
        if (hideDelayTimer)
        {
          clearTimeout(hideDelayTimer);
        } 

        var hide_function = function()
                            {
                              hideDelayTimer = null;
                              popup.animate( {
                                                top:      '-=' + distance + 'px',
                                                opacity:  0
                                             },
                                             time,
                                             'swing',
                                             function()
                                             {
                                                // once the animate is complete, set the tracker variables
                                                shown = false;
                                                // hide the popup entirely after the effect (opacity alone doesn't do the job)
                                                popup.css('display', 'none');
                                             });
                            }        

        // store the timer so that it can be cleared in the mouseover if required
        hideDelayTimer = setTimeout( hide_function, hideDelay );
    } );
  } );
} );
