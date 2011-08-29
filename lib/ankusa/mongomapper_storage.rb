require 'mongo_mapper'

module Ankusa 
   
  class Klass
    include MongoMapper::Document
  
    key :name, String
    key :tags, Array        
  end     
  
  class Totals   
    include MongoMapper::Document

  end
  
  class MongomapperStorage  
    
    def initialize(options=nil)
      @connection = Mongomapper.new
      @klass_word_counts = {}
      @klass_doc_counts = {}   
    end

    #
    # Fetch the names of the distinct classes for classification:
    # eg. :spam, :good, etc
    #
    def classnames
    end

    def reset
      drop_tables
      init_tables
    end

    #
    # Drop ankusa keyspace, reset internal caches
    #
    def drop_tables
      @klass_word_counts = {}
      @klass_doc_counts = {}
    end


    #
    # Create required keyspace and column families
    #
    def init_tables
    end

    #
    # Fetch hash of word counts as a single row from cassandra.
    # Here column_name is the class and column value is the count
    #
    def get_word_counts(word)
    end

    #
    # Does a table 'scan' of summary table pulling out the 'vocabsize' column
    # from each row. Generates a hash of (class, vocab_size) key value pairs
    #
    def get_vocabulary_sizes
    end

    #
    # Fetch total word count for a given class and cache it
    #
    def get_total_word_count(klass)
    end

    #
    # Fetch total documents for a given class and cache it
    #
    def get_doc_count(klass)
    end

    #
    # Increment the count for a given (word,class) pair. Evidently, cassandra
    # does not support atomic increment/decrement. Psh. HBase uses ZooKeeper to
    # implement atomic operations, ain't it special?
    #
    def incr_word_count(klass, word, count)
    end

    #
    # Increment total word count for a given class by 'count'
    #
    def incr_total_word_count(klass, count)
    end

    #
    # Increment total document count for a given class by 'count'
    #
    def incr_doc_count(klass, count)
    end

    def doc_count_totals
    end

    #
    # Doesn't do anything
    #
    def close
    end

    protected

    #
    # Fetch 100 rows from summary table, yes, increase if necessary
    #
    def get_summary(name)
    end      
  end
end