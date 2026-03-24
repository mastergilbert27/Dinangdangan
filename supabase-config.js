// supabase-config.js

import { createClient } from '@supabase/supabase-js';

// Initialize Supabase with your own credentials
const supabaseUrl = 'https://your-supabase-url.supabase.co';
const supabaseAnonKey = 'your-anon-key';

const supabase = createClient(supabaseUrl, supabaseAnonKey);

// Function to get data from a table
export const getData = async (tableName) => {
    const { data, error } = await supabase
        .from(tableName)
        .select('*');
    if (error) throw error;
    return data;
};

// Function to insert data into a table
export const insertData = async (tableName, data) => {
    const { data: insertedData, error } = await supabase
        .from(tableName)
        .insert(data);
    if (error) throw error;
    return insertedData;
};