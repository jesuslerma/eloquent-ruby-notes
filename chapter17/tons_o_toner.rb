module TonsOToner
  class PrintQueue
    def submit( print_job )
    end

    def cancel( print_job )
    end
  end

  class Administration
    def power_off
    end
    
    def test
      puts 'From TonsOfToner'
    end

    def start_self_test
    end
  end
end
