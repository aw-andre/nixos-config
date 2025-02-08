{
  programs.wofi = {
    enable = true;
    style = ''
      /* The name of the window itself */
      #window {
        background-color: rgba(24, 24, 24, 0.6);
        box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -4px rgba(0, 0, 0, 0.1);
        border-radius: 1rem;
        font-size: 1.2rem;
        /* The name of the box that contains everything */
      }
      #window #outer-box {
        /* The name of the search bar */
        /* The name of the scrolled window containing all of the entries */
      }
      #window #outer-box #input {
        background-color: rgba(24, 24, 24, 0.6);
        color: #f2f2f2;
        border: none;
        border-bottom: 1px solid rgba(24, 24, 24, 0.2);
        padding: 0.8rem 1rem;
        font-size: 1.5rem;
        border-radius: 1rem 1rem 0 0;
      }
      #window #outer-box #input:focus, #window #outer-box #input:focus-visible, #window #outer-box #input:active {
        border: none;
        outline: 2px solid transparent;
        outline-offset: 2px;
      }
      #window #outer-box #scroll {
        /* The name of the box containing all of the entries */
      }
      #window #outer-box #scroll #inner-box {
        /* The name of all entries */
        /* The name of all boxes shown when expanding  */
        /* entries with multiple actions */
      }
      #window #outer-box #scroll #inner-box #entry {
        color: #fff;
        background-color: rgba(24, 24, 24, 0.1);
        padding: 0.6rem 1rem;
        /* The name of all images in entries displayed in image mode */
        /* The name of all the text in entries */
      }
      #window #outer-box #scroll #inner-box #entry #img {
        width: 1rem;
        margin-right: 0.5rem;
      }
      #window #outer-box #scroll #inner-box #entry:selected {
        color: #fff;
        background-color: rgba(255, 255, 255, 0.1);
        outline: none;
      }
    '';
  };
}
