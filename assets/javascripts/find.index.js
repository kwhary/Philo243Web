    // Function to find the index in an array of the first entry  
    // with a specific value. 
    // It is used to get the index of a column in the column list. 
    Array.prototype.findIdx = function(value){ 
        for (var i=0; i < this.length; i++) { 
            if (this[i] == value) { 
                return i; 
            } 
        } 
    } 