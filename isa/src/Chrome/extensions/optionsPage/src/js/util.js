export const deepEqual = (a, b) => {
  const t1 = typeof a;
  const t2 = typeof b;
  if (t1 !== t2) { return false; }
  if (t1 !== 'object' || a == null) { return a === b; }

  const k1 = Object.keys(a).sort();
  const k2 = Object.keys(b).sort();
  if (k1.length !== k2.length) { return false; }

  for (let i = 0, len = k1.length; i < len; i++) {
    if (k1[i] !== k2[i]) { return false; }
    if (!deepEqual(a[k1[i]], b[k2[i]])) { return false; }
  }

  return true;
};

export const deepClone = (obj) => {
  if (!(obj instanceof Object)) { return obj; }
  if (Array.isArray(obj)) {
    return obj.slice().map(deepClone);
  } else {
    const clone = {};
    for (let prop in obj) { clone[prop] = deepClone(obj[prop]); }
    return clone;
  }
};

export const debounce = (wait, func) => {
  let timeout;
  return (...args) => {
    clearTimeout(timeout);
    timeout = setTimeout(() => {
      func(...args);
    }, wait);
  };
};
