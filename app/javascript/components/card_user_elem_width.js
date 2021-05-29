const sizeUserCardElems = () => {
  if (document.querySelector('.user-card-info')) {
    document.querySelectorAll('.user-card-info').forEach((elem) => {
      let childWidth = Math.round((100 / elem.childElementCount) * 100) / 100
      let arr = Array.from(elem.children)
      arr.forEach((child) => {
        child.style.width = `${childWidth}%`;
      });
      arr[arr.length - 1].style.textAlign = 'right';
    });
  }
};

export { sizeUserCardElems };
